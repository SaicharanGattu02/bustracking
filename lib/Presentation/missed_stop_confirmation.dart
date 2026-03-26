import 'package:bustracking/Components/CustomAppBar.dart';
import 'package:bustracking/Components/CustomAppButton.dart';
import 'package:bustracking/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/constants.dart';

class MissedStopConfirmation extends StatefulWidget {
  const MissedStopConfirmation({super.key});

  @override
  State<MissedStopConfirmation> createState() => _MissedStopConfirmationState();
}

class _MissedStopConfirmationState extends State<MissedStopConfirmation> {
  final ValueNotifier<int> selectedReason = ValueNotifier(0);
  final TextEditingController notesController = TextEditingController();
  final PageController pageController = PageController();
  static const List<String> reasons = [
    'Student absent (Informed)',
    'Roadblock / traffic diversion',
    'No student at stop',
    'Stop skipped unintentionally',
  ];
  final ValueNotifier<int> currentStop = ValueNotifier(0);

  final List<Map<String, String>> stops = [
    {"name": "Rajeev nagar", "index": "1/3"},
    {"name": "Indira nagar", "index": "2/3"},
    {"name": "MG Road", "index": "3/3"},
  ];
  @override
  void dispose() {
    selectedReason.dispose();
    currentStop.dispose();
    notesController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Missed Stop Confirmation', actions: []),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(18, 20, 18, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'The system detected a stop was not covered.\nPlease confirm or update the reason.',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: figtree,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF6B7280),
                      ),
                    ),

                    const SizedBox(height: 20),
                    SizedBox(
                      height: 90,
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: stops.length,
                        onPageChanged: (i) {
                          currentStop.value = i;
                        },
                        itemBuilder: (context, index) {
                          final stop = stops[index];

                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffF9FAFB),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xffE5E7EB),
                              ),
                            ),
                            child: Row(
                              children: [
                                /// ICON CIRCLE
                                Container(
                                  width: 52,
                                  height: 52,
                                  decoration: const BoxDecoration(
                                    color: Color(0xffFEE2E2),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.directions_bus_filled,
                                    color: Color(0xffEF4444),
                                    size: 26,
                                  ),
                                ),

                                const SizedBox(width: 14),

                                /// TEXT
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "STOP DETAILS",
                                        style: TextStyle(
                                          fontFamily: figtree,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff9CA3AF),
                                          letterSpacing: 1,
                                        ),
                                      ),

                                      const SizedBox(height: 4),

                                      Text(
                                        stop["name"]!,
                                        style: TextStyle(
                                          fontFamily: figtree,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: const Color(0xff000000),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff3B82F6),
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: Text(
                                    stop["index"]!,
                                    style: TextStyle(
                                      fontFamily: figtree,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 26),

                    Text(
                      'SELECT REASON',
                      style: TextStyle(
                        fontFamily: figtree,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF1A1A2E),
                        letterSpacing: 1.0,
                      ),
                    ),

                    const SizedBox(height: 12),

                    ValueListenableBuilder(
                      valueListenable: selectedReason,
                      builder: (context, value, _) {
                        return Column(
                          children: reasons.asMap().entries.map((entry) {
                            final index = entry.key;
                            final label = entry.value;
                            final isSelected = value == index;

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: InkWell(
                                onTap: () => selectedReason.value = index,
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: isSelected
                                          ? const Color(0xFFE53935)
                                          : const Color(0xFFE5E7EB),
                                      width: isSelected ? 1.5 : 1,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: isSelected
                                                ? const Color(0xFFE53935)
                                                : Colors.grey.shade400,
                                            width: isSelected ? 0 : 1.5,
                                          ),
                                          color: isSelected
                                              ? const Color(0xFFE53935)
                                              : Colors.transparent,
                                        ),
                                        child: isSelected
                                            ? const Icon(
                                                Icons.circle,
                                                size: 10,
                                                color: Colors.white,
                                              )
                                            : null,
                                      ),

                                      const SizedBox(width: 12),

                                      Text(
                                        label,
                                        style: TextStyle(
                                          fontFamily: figtree,
                                          fontSize: 16,
                                          fontWeight: isSelected
                                              ? FontWeight.w600
                                              : FontWeight.w400,
                                          color: const Color(0xFF111827),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          context.push('/report_an_issue');
                        },
                        child: Text(
                          'Report as issue',
                          style: TextStyle(
                            fontFamily: figtree,
                            fontSize: 13,
                            decoration: TextDecoration.underline,
                            decorationColor: primaryColor,
                            fontWeight: FontWeight.w600,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    Text(
                      'ADDITIONAL NOTES',
                      style: TextStyle(
                        fontFamily: figtree,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF000000),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Container(
                      height: 96,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFFE5E7EB),
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: notesController,
                        maxLines: null,
                        expands: true,
                        style: TextStyle(
                          fontFamily: figtree,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF111827),
                        ),
                        decoration: InputDecoration(
                          hintText: "Add any additional notes...",
                          hintStyle: TextStyle(
                            fontFamily: figtree,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF9CA3AF),
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(16, 0, 16, 20),
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              ValueListenableBuilder(
                valueListenable: currentStop,
                builder: (context, value, _) {
                  final bool isLast = value == stops.length - 1;

                  return CustomAppButton(
                    text: isLast ? "Submit" : "Next",
                    onPlusTap: () {
                      if (!isLast) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                        );
                      } else {
                        print("Submit pressed");
                      }
                    },
                  );
                },
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Ignore',
                    style: TextStyle(
                      fontFamily: figtree,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF6B7280),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
