import 'package:flutter/material.dart';

class ReportSubmit extends StatefulWidget {
  const ReportSubmit({super.key});

  @override
  State<ReportSubmit> createState() => _ReportSubmitState();
}

class _ReportSubmitState extends State<ReportSubmit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: 160,
                height: 160,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Soft light grey background blob
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F1F5),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    // Document icon
                    Positioned(
                      top: 22,
                      child: Container(
                        width: 90,
                        height: 108,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Document lines
                            Container(
                              width: 52,
                              height: 6,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE5E7EB),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              width: 52,
                              height: 6,
                              decoration: BoxDecoration(
                                color: const Color(0xFFE5E7EB),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Container(
                              width: 36,
                              height: 6,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEEEFF2),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Green check badge
                    Positioned(
                      bottom: 10,
                      right: 14,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(
                          color: Color(0xFF4CAF50),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check_rounded,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // ── Title ─────────────────────────────────────────────────
              const Text(
                "We've Received Your Report",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A2E),
                  height: 1.3,
                ),
              ),

              const SizedBox(height: 14),

              // ── Subtitle ──────────────────────────────────────────────
              const Text(
                'Thank you for notifying us. The\ntransport administration team has\nbeen alerted.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.5,
                  color: Color(0xFF6B7280),
                  height: 1.65,
                ),
              ),

              const SizedBox(height: 32),

              // ── Category chip ─────────────────────────────────────────
              Container(
                width: double.infinity,
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
                ),
                child: Row(
                  children: [
                    // Icon stack: red + bus icon
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFEBEB),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.directions_bus_rounded,
                            color: Color(0xFFE53935),
                            size: 20,
                          ),
                        ),
                        Positioned(
                          bottom: -2,
                          right: -2,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE53935),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.warning_rounded,
                              color: Colors.white,
                              size: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 14),
                    // Category label + value
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CATEGORY',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade400,
                            letterSpacing: 0.8,
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'Breakdown reported',
                          style: TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1A1A2E),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Green check on right
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8F5E9),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check_rounded,
                        color: Color(0xFF4CAF50),
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(flex: 3),

              // ── View Summary button ───────────────────────────────────
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE53935),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'View Summary',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}