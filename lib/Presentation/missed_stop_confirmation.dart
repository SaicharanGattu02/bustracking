import 'package:flutter/material.dart';

class MissedStopConfirmation extends StatefulWidget {
  const MissedStopConfirmation({super.key});

  @override
  State<MissedStopConfirmation> createState() =>
      _MissedStopConfirmationState();
}

class _MissedStopConfirmationState
    extends State<MissedStopConfirmation> {
  int _selectedReason = 0;
  final TextEditingController _notesController = TextEditingController();

  static const List<String> _reasons = [
    'Student absent (Informed)',
    'Roadblock / traffic diversion',
    'No student at stop',
    'Stop skipped unintentionally',
  ];

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: Column(
        children: [
          // ── Blue top accent bar ───────────────────────────────────────
          Container(height: 4, color: const Color(0xFF1565C0)),

          // ── SafeArea + content ────────────────────────────────────────
          Expanded(
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  // ── AppBar ──────────────────────────────────────────
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
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
                        const SizedBox(width: 12),
                        const Text(
                          'Missed Stop Confirmation',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1A1A2E),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ── Scrollable body ─────────────────────────────────
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(18, 20, 18, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ── Subtitle ──────────────────────────────
                          const Text(
                            'The system detected a stop was not covered.\nPlease confirm or update the reason.',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF6B7280),
                              height: 1.55,
                            ),
                          ),

                          const SizedBox(height: 20),

                          // ── Stop Details Card ─────────────────────
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                // Bus stop icon
                                Container(
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFF3E0),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.directions_bus_rounded,
                                    color: Color(0xFFFF6F00),
                                    size: 22,
                                  ),
                                ),
                                const SizedBox(width: 14),
                                // Stop info
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'STOP DETAILS',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey.shade500,
                                          letterSpacing: 0.8,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      const Text(
                                        'Rajeev nagar',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF1A1A2E),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // V3 badge
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1565C0),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    'V3',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 26),

                          // ── Select Reason label ───────────────────
                          const Text(
                            'SELECT REASON',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A1A2E),
                              letterSpacing: 1.0,
                            ),
                          ),

                          const SizedBox(height: 12),

                          // ── Radio Options ─────────────────────────
                          ..._reasons.asMap().entries.map((entry) {
                            final index = entry.key;
                            final label = entry.value;
                            final isSelected = _selectedReason == index;

                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: InkWell(
                                onTap: () =>
                                    setState(() => _selectedReason = index),
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 14),
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
                                      // Custom radio circle
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
                                            ? const Icon(Icons.circle,
                                            size: 10, color: Colors.white)
                                            : null,
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        label,
                                        style: TextStyle(
                                          fontSize: 13.5,
                                          fontWeight: isSelected
                                              ? FontWeight.w600
                                              : FontWeight.w400,
                                          color: const Color(0xFF1A1A2E),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),

                          // ── Report as issue link ──────────────────
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text(
                                'Report as issue',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFE53935),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 22),

                          // ── Additional Notes label ────────────────
                          const Text(
                            'ADDITIONAL NOTES',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF1A1A2E),
                              letterSpacing: 1.0,
                            ),
                          ),

                          const SizedBox(height: 10),

                          // ── Notes TextField ───────────────────────
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: const Color(0xFFE5E7EB), width: 1),
                            ),
                            child: TextField(
                              controller: _notesController,
                              maxLines: 5,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xFF1A1A2E),
                              ),
                              decoration: InputDecoration(
                                hintText: 'Add any additional notes...',
                                hintStyle: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade400,
                                ),
                                contentPadding: const EdgeInsets.all(14),
                                border: InputBorder.none,
                              ),
                            ),
                          ),

                          const SizedBox(height: 32),

                          // ── Next Button ───────────────────────────
                          SizedBox(
                            width: double.infinity,
                            height: 52,
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
                                'Next',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 14),

                          // ── Ignore link ───────────────────────────
                          Center(
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text(
                                'Ignore',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF6B7280),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}