import 'package:flutter/material.dart';

class TripData {
  final String title;
  final String date;
  final String departure;
  final String arrival;
  final String duration;
  final bool isHomeToSchool;

  const TripData({
    required this.title,
    required this.date,
    required this.departure,
    required this.arrival,
    required this.duration,
    required this.isHomeToSchool,
  });
}

class TripHistory extends StatefulWidget {
  const TripHistory({super.key});

  static const List<TripData> _trips = [
    TripData(
      title: 'Home to School',
      date: 'Yesterday, Oct 23',
      departure: '07:45\nAM',
      arrival: '08:27\nAM',
      duration: '42 min',
      isHomeToSchool: true,
    ),
    TripData(
      title: 'Home to School',
      date: 'Yesterday, Oct 23',
      departure: '07:45\nAM',
      arrival: '08:27\nAM',
      duration: '42 min',
      isHomeToSchool: true,
    ),
    TripData(
      title: 'Home to School',
      date: 'Yesterday, Oct 23',
      departure: '07:45\nAM',
      arrival: '08:27\nAM',
      duration: '42 min',
      isHomeToSchool: true,
    ),
    TripData(
      title: 'School to Home',
      date: 'Yesterday, Oct 23',
      departure: '15:40\nPM',
      arrival: '16:25\nPM',
      duration: '45 min',
      isHomeToSchool: false,
    ),
  ];

  @override
  State<TripHistory> createState() => _TripHistoryState();
}

class _TripHistoryState extends State<TripHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Column(
          children: [
            // ── AppBar ────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.maybePop(context),
                    borderRadius: BorderRadius.circular(8),
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.arrow_back, size: 22, color: Color(0xFF1A1A2E)),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Trip History',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(8),
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.tune_rounded, size: 22, color: Color(0xFF1A1A2E)),
                    ),
                  ),
                ],
              ),
            ),

            // ── Scrollable Body ───────────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),

                    // ── Your Trips heading ────────────────────────────────
                    const Text(
                      'Your Trips',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // ── Stats Row ─────────────────────────────────────────
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'TOTAL TRIPS',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade500,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  '42',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF1A1A2E),
                                    height: 1.1,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  '+4 this week',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF4CAF50),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'TOTAL DRIVING',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey.shade500,
                                    letterSpacing: 0.8,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  '72h',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF1A1A2E),
                                    height: 1.1,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  '13h this week',
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF4CAF50),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // ── Last 5 Trips heading ──────────────────────────────
                    const Text(
                      'Last 5 Trips',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // ── Trip Cards ────────────────────────────────────────
                    ...TripHistory._trips.map((trip) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _buildTripCard(trip),
                    )),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Trip Card ─────────────────────────────────────────────────────────────
  Widget _buildTripCard(TripData trip) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title row with icon
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F4FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  trip.isHomeToSchool ? Icons.school_rounded : Icons.home_rounded,
                  size: 18,
                  color: const Color(0xFF3949AB),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    trip.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  Text(
                    trip.date,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Departure → duration → Arrival row
          Row(
            children: [
              // Departure
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Departure',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    trip.departure,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                      height: 1.25,
                    ),
                  ),
                ],
              ),

              // Arrow + Duration
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 14),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 1,
                          color: Colors.grey.shade300,
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                        ),
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Text(
                            trip.duration,
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.arrow_forward,
                          size: 14,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Arrival
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Arrival',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    trip.arrival,
                    textAlign: TextAlign.end,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                      height: 1.25,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}