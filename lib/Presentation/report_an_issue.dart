import 'package:flutter/material.dart';

class ReportAnIssueScreen extends StatefulWidget {
  const ReportAnIssueScreen({super.key});

  @override
  State<ReportAnIssueScreen> createState() => _ReportAnIssueScreenState();
}

class _ReportAnIssueScreenState extends State<ReportAnIssueScreen> {
  // 'breakdown' or one of the other issue tags
  String _selectedIssue = 'breakdown';

  static const List<String> _otherIssues = [
    'Delay at Stop',
    'Student Absent',
    'Route Obstruction',
    'Technical Issue',
    'Other',
  ];

  final TextEditingController _descController = TextEditingController();

  @override
  void dispose() {
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Column(
          children: [
            // ── AppBar ──────────────────────────────────────────────────
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
                      'Report an Issue',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                ],
              ),
            ),

            // ── Scrollable body ─────────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(18, 4, 18, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Subtitle ────────────────────────────────────────
                    const Text(
                      'Help the transport team resolve problems by\nreporting any issues encountered during the\ntrip.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xFF6B7280),
                        height: 1.6,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ── BREAKDOWN label ──────────────────────────────────
                    const Text(
                      'BREAKDOWN',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A2E),
                        letterSpacing: 1.0,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // ── Breakdown card ───────────────────────────────────
                    GestureDetector(
                      onTap: () =>
                          setState(() => _selectedIssue = 'breakdown'),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                        decoration: BoxDecoration(
                          color: _selectedIssue == 'breakdown'
                              ? const Color(0xFFFFF5F5)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: _selectedIssue == 'breakdown'
                                ? const Color(0xFFE53935)
                                : const Color(0xFFE5E7EB),
                            width: _selectedIssue == 'breakdown' ? 1.5 : 1,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Radio circle
                            Container(
                              width: 20,
                              height: 20,
                              margin: const EdgeInsets.only(top: 1),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _selectedIssue == 'breakdown'
                                    ? const Color(0xFFE53935)
                                    : Colors.transparent,
                                border: Border.all(
                                  color: _selectedIssue == 'breakdown'
                                      ? const Color(0xFFE53935)
                                      : Colors.grey.shade400,
                                  width: 1.5,
                                ),
                              ),
                              child: _selectedIssue == 'breakdown'
                                  ? const Icon(Icons.circle,
                                  size: 9, color: Colors.white)
                                  : null,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Report bus breakdown',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: _selectedIssue == 'breakdown'
                                          ? const Color(0xFFE53935)
                                          : const Color(0xFF1A1A2E),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  const Text(
                                    'Only report if bus halted in middle of the journey. This is reported to users and admin.',
                                    style: TextStyle(
                                      fontSize: 11.5,
                                      color: Color(0xFF9E9E9E),
                                      height: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ── OTHER ISSUES label ────────────────────────────────
                    const Text(
                      'OTHER ISSUES',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A2E),
                        letterSpacing: 1.0,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // ── Chip wrap ────────────────────────────────────────
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: _otherIssues.map((issue) {
                        final isSelected = _selectedIssue == issue;
                        return GestureDetector(
                          onTap: () =>
                              setState(() => _selectedIssue = issue),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18, vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFFFFF5F5)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFFE53935)
                                    : const Color(0xFFE5E7EB),
                                width: isSelected ? 1.5 : 1,
                              ),
                            ),
                            child: Text(
                              issue,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                                color: isSelected
                                    ? const Color(0xFFE53935)
                                    : const Color(0xFF374151),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 26),

                    // ── DESCRIPTION label ─────────────────────────────────
                    const Text(
                      'DESCRIPTION',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A2E),
                        letterSpacing: 1.0,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // ── Description text field ────────────────────────────
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                            color: const Color(0xFFE5E7EB), width: 1),
                      ),
                      child: TextField(
                        controller: _descController,
                        maxLines: 5,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF1A1A2E),
                        ),
                        decoration: InputDecoration(
                          hintText: 'Briefly describe what happened...',
                          hintStyle: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade400,
                          ),
                          contentPadding: const EdgeInsets.all(14),
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 26),

                    // ── EVIDENCE label ────────────────────────────────────
                    const Text(
                      'EVIDENCE',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A2E),
                        letterSpacing: 1.0,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // ── Upload photo box ──────────────────────────────────
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(14),
                      child: Container(
                        width: double.infinity,
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: const Color(0xFFDDE1E7),
                            width: 1.5,
                            // dashed feel via strokeAlign
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: 28,
                              color: Colors.grey.shade400,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Upload Photo',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // ── Submit Report button ──────────────────────────────
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
                          'Submit Report',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    // ── Cancel link ───────────────────────────────────────
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: const Text(
                          'Cancel',
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
    );
  }
}