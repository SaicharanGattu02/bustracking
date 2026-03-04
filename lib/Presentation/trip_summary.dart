import 'package:flutter/material.dart';


class TripSummary extends StatefulWidget {
  const TripSummary({super.key});

  @override
  State<TripSummary> createState() => _TripSummaryState();
}

class _TripSummaryState extends State<TripSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Column(
          children: [
            // ── AppBar ──────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.maybePop(context),
                    borderRadius: BorderRadius.circular(8),
                    child: const Padding(
                      padding: EdgeInsets.all(4),
                      child: Icon(Icons.arrow_back,
                          size: 22, color: Color(0xFF1A1A2E)),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'Trip Summary',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                  ),
                  // Placeholder to balance the back arrow
                  const SizedBox(width: 30),
                ],
              ),
            ),

            // ── Scrollable body ─────────────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Success icon + title ──────────────────────────────
                    Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          // Glowing green circle
                          Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFFE8F5E9),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                  const Color(0xFF4CAF50).withOpacity(0.25),
                                  blurRadius: 24,
                                  spreadRadius: 4,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.check_circle_rounded,
                              color: Color(0xFF4CAF50),
                              size: 46,
                            ),
                          ),
                          const SizedBox(height: 18),
                          const Text(
                            'Trip Successfully\nCompleted',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF1A1A2E),
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),

                    // ── Bus / Route / Mode card ───────────────────────────
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
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
                        children: [
                          _buildInfoRow('BUS', 'KA-05-1234'),
                          _buildDivider(),
                          _buildInfoRow('ROUTE', 'North Campus Express'),
                          _buildDivider(),
                          _buildInfoRow('MODE', 'Morning Pickup'),
                        ],
                      ),
                    ),

                    const SizedBox(height: 26),

                    // ── Trip Details heading ──────────────────────────────
                    const Text(
                      'Trip Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // ── Details card ──────────────────────────────────────
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(18, 20, 18, 20),
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
                        children: [
                          // ── Row 1: Start / End / Duration ───────────────
                          Row(
                            children: [
                              _buildStatColumn('START', '07:30 AM',
                                  valueSize: 18),
                              _buildStatColumn('END', '08:15 AM',
                                  valueSize: 18),
                              _buildStatColumn('DURATION', '45m',
                                  valueSize: 18),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // ── Row 2: Total Stops / Covered ────────────────
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.trip_origin,
                                            size: 13,
                                            color: Color(0xFF9E9E9E)),
                                        const SizedBox(width: 4),
                                        Text(
                                          'TOTAL STOPS',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey.shade500,
                                            letterSpacing: 0.6,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      '45',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF1A1A2E),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.check_circle_outline,
                                            size: 13,
                                            color: Color(0xFF4CAF50)),
                                        const SizedBox(width: 4),
                                        Text(
                                          'COVERED',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey.shade500,
                                            letterSpacing: 0.6,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      '42',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF1A1A2E),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 20),

                          // ── Row 3: Missed Stops ──────────────────────────
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF5F5),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: const Color(0xFFFFE0E0), width: 1),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFEBEB),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.flag_rounded,
                                    size: 18,
                                    color: Color(0xFFE53935),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'MISSED STOPS',
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey.shade500,
                                        letterSpacing: 0.6,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    const Text(
                                      '3',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFF1A1A2E),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 6),
                                    minimumSize: Size.zero,
                                    tapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: const Text(
                                    'VIEW',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFE53935),
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // ── Confirm & Finish button ───────────────────────────
                    Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                            color: const Color(0xFFE5E7EB), width: 1.5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(16),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Confirm & Finish',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF1A1A2E),
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.arrow_forward,
                                  size: 20, color: Color(0xFF1A1A2E)),
                            ],
                          ),
                        ),
                      ),
                    ),

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

  // ── Helper: Info row (Bus / Route / Mode) ────────────────────────────────
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade400,
              letterSpacing: 0.8,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A2E),
            ),
          ),
        ],
      ),
    );
  }

  // ── Helper: thin divider ─────────────────────────────────────────────────
  Widget _buildDivider() {
    return Divider(height: 1, thickness: 1, color: Colors.grey.shade100);
  }

  // ── Helper: stat column (Start / End / Duration) ─────────────────────────
  Widget _buildStatColumn(String label, String value,
      {double valueSize = 16}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade500,
              letterSpacing: 0.7,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: valueSize,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF1A1A2E),
            ),
          ),
        ],
      ),
    );
  }
}