import 'dart:math';
import 'package:bustracking/Components/CustomAppBar.dart';
import 'package:bustracking/utils/color_constants.dart';
import 'package:bustracking/utils/constants.dart';
import 'package:bustracking/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:go_router/go_router.dart';
import '../../Components/CustomAppButton.dart';
import '../../core/theme/ThemeHelper.dart';

const double kMaxDistanceMeters = 100.0;

// Realistic route: Punjagutta → Begumpet (Hyderabad)
final List<LatLng> kRoutePolyline = [
  LatLng(17.4300, 78.4501), // Punjagutta
  LatLng(17.4325, 78.4525),
  LatLng(17.4350, 78.4550),
  LatLng(17.4375, 78.4575),
  LatLng(17.4400, 78.4600),
  LatLng(17.4425, 78.4625),
  LatLng(17.4447, 78.4664), // Begumpet
];

class BusStop {
  final String name;
  final LatLng position;
  const BusStop({required this.name, required this.position});
}

final List<BusStop> kBusStops = [
  BusStop(name: 'Punjagutta', position: LatLng(17.4300, 78.4501)),
  BusStop(name: 'Somajiguda', position: LatLng(17.4350, 78.4550)),
  BusStop(name: 'Begumpet', position: LatLng(17.4447, 78.4664)),
];

double _haversine(LatLng a, LatLng b) {
  const R = 6371000.0;
  final dLat = (b.latitude - a.latitude) * pi / 180;
  final dLng = (b.longitude - a.longitude) * pi / 180;
  final a1 = sin(dLat / 2);
  final a2 = sin(dLng / 2);
  final x = a1 * a1 + cos(a.latitude * pi / 180) * cos(b.latitude * pi / 180) * a2 * a2;
  return R * 2 * atan2(sqrt(x), sqrt(1 - x));
}

double minDistToRoute(LatLng point, List<LatLng> polyline) {
  double minDist = double.infinity;
  for (int i = 0; i < polyline.length - 1; i++) {
    final d = _distToSegment(point, polyline[i], polyline[i + 1]);
    if (d < minDist) minDist = d;
  }
  return minDist;
}

double _distToSegment(LatLng p, LatLng a, LatLng b) {
  final dx = b.latitude - a.latitude;
  final dy = b.longitude - a.longitude;
  if (dx == 0 && dy == 0) return _haversine(p, a);

  final t = ((p.latitude - a.latitude) * dx + (p.longitude - a.longitude) * dy) / (dx * dx + dy * dy);
  final tClamped = t.clamp(0.0, 1.0);
  final proj = LatLng(a.latitude + tClamped * dx, a.longitude + tClamped * dy);
  return _haversine(p, proj);
}

enum BoardingState { idle, tooFar, valid }

class SelectBoardingPoint extends StatefulWidget {
  const SelectBoardingPoint({super.key});

  @override
  State<SelectBoardingPoint> createState() => _SelectBoardingPointState();
}

class _SelectBoardingPointState extends State<SelectBoardingPoint> {
  final MapController _mapController = MapController();

  // ValueNotifiers
  final ValueNotifier<LatLng?> _selectedPinNotifier = ValueNotifier<LatLng?>(null);
  final ValueNotifier<double> _distanceNotifier = ValueNotifier<double>(0.0);
  final ValueNotifier<BoardingState> _stateNotifier = ValueNotifier<BoardingState>(BoardingState.idle);
  final ValueNotifier<bool> _isLoadingNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<LatLng?> _currentLocationNotifier = ValueNotifier<LatLng?>(null);

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    _selectedPinNotifier.dispose();
    _distanceNotifier.dispose();
    _stateNotifier.dispose();
    _isLoadingNotifier.dispose();
    _currentLocationNotifier.dispose();
    super.dispose();
  }

  Future<void> _getCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final currentPos = LatLng(position.latitude, position.longitude);
      _currentLocationNotifier.value = currentPos;

      // Center map on current location
      _mapController.move(currentPos, 15.5);
    } catch (e) {
      debugPrint("Location permission denied: $e");
    }
  }

  void _onMapTap(TapPosition tapPosition, LatLng point) {
    final dist = minDistToRoute(point, kRoutePolyline);
    final isValid = dist <= kMaxDistanceMeters;

    _selectedPinNotifier.value = point;
    _distanceNotifier.value = dist;
    _stateNotifier.value = isValid ? BoardingState.valid : BoardingState.tooFar;
  }

  void _confirmBoardingPoint() {
    if (_stateNotifier.value != BoardingState.valid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please place the pin within 100 meters of the route")),
      );
      return;
    }

    _isLoadingNotifier.value = true;

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      _isLoadingNotifier.value = false;
      // context.goReplacement('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ThemeHelper.isDarkMode(context);
    final primary = primaryColor;

    return Scaffold(
      backgroundColor: ThemeHelper.backgroundColor(context),
      appBar: const CustomAppBar(title: "Select Boarding Point", actions: [],),
      body: Stack(
        children: [
          // Flutter Map
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: LatLng(17.436, 78.455), // Center between Punjagutta and Begumpet
              initialZoom: 14.8,
              onTap: _onMapTap,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.bustracking.app',
              ),

              // Solid Route Line (Main bus route)
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: kRoutePolyline,
                    color: primary.withOpacity(0.9),
                    strokeWidth: 6,
                  ),
                ],
              ),

              // Dotted Line (Walking path feel)
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: kRoutePolyline,
                    color: primary.withOpacity(0.5),
                    strokeWidth: 3,
                    isDotted: true,
                  ),
                ],
              ),

              // Selected Boarding Pin
              ValueListenableBuilder<LatLng?>(
                valueListenable: _selectedPinNotifier,
                builder: (context, pin, _) {
                  if (pin == null) return const SizedBox.shrink();
                  return MarkerLayer(
                    markers: [
                      Marker(
                        point: pin,
                        width: 60,
                        height: 80,
                        child: _PinMarker(
                          isValid: _stateNotifier.value == BoardingState.valid,
                        ),
                      ),
                    ],
                  );
                },
              ),

              // Current Location Marker
              ValueListenableBuilder<LatLng?>(
                valueListenable: _currentLocationNotifier,
                builder: (context, location, _) {
                  if (location == null) return const SizedBox.shrink();
                  return MarkerLayer(
                    markers: [
                      Marker(
                        point: location,
                        width: 50,
                        height: 50,
                        child: const Icon(Icons.my_location, color: Colors.blue, size: 36),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),

          // Distance Badge
          ValueListenableBuilder<double>(
            valueListenable: _distanceNotifier,
            builder: (context, distance, _) {
              if (distance == 0) return const SizedBox.shrink();

              final isValid = _stateNotifier.value == BoardingState.valid;

              return Positioned(
                top: 140,
                left: 20,
                right: 20,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                    decoration: BoxDecoration(
                      color: isValid ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10)],
                    ),
                    child: Text(
                      isValid
                          ? "✓ Within limit (${distance.round()}m)"
                          : "Too far (${distance.round()}m from route)",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          // Bottom Panel
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomPanel(),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPanel() {
    return ValueListenableBuilder<BoardingState>(
      valueListenable: _stateNotifier,
      builder: (context, state, _) {
        if (state == BoardingState.idle) {
          return _buildIdleHint();
        }

        return Container(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 30),
          decoration: BoxDecoration(
            color: ThemeHelper.backgroundColor(context),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 20, offset: const Offset(0, -8))],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (state == BoardingState.tooFar)
                const Text(
                  "Move the pin closer to the route line",
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),

              if (state == BoardingState.valid)
                const Text(
                  "Boarding point looks good!",
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
                ),

              const SizedBox(height: 16),

              ValueListenableBuilder<bool>(
                valueListenable: _isLoadingNotifier,
                builder: (context, isLoading, _) {
                  return CustomAppButton(
                    text: state == BoardingState.valid ? "Confirm Boarding Point" : "Adjust Pin",
                    textcolor: Colors.white,
                    onPlusTap: isLoading ? null : _confirmBoardingPoint,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIdleHint() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ThemeHelper.cardColor(context),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text(
        "Tap anywhere on the map to place your boarding pin.\nIt must be within 100 meters of the route.",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }
}

// Pin Marker
class _PinMarker extends StatelessWidget {
  final bool isValid;

  const _PinMarker({required this.isValid});

  @override
  Widget build(BuildContext context) {
    final color = isValid ? Colors.green : Colors.red;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: color.withOpacity(0.4), blurRadius: 12)],
          ),
          child: Icon(
            isValid ? Icons.check_rounded : Icons.close_rounded,
            color: Colors.white,
            size: 22,
          ),
        ),
        const SizedBox(height: 4),
        Icon(Icons.arrow_drop_down_rounded, color: color, size: 32),
      ],
    );
  }
}