import 'package:bustracking/Components/CustomAppBar.dart';
import 'package:bustracking/Components/CustomAppButton.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../utils/constants.dart';
import 'package:dotted_border/dotted_border.dart';

class ReportAnIssueScreen extends StatefulWidget {
  const ReportAnIssueScreen({super.key});

  @override
  State<ReportAnIssueScreen> createState() => _ReportAnIssueScreenState();
}

class _ReportAnIssueScreenState extends State<ReportAnIssueScreen> {
  final ValueNotifier<String> selectedIssue = ValueNotifier("breakdown");

  static const List<String> otherIssues = [
    'Delay at Stop',
    'Student Absent',
    'Route Obstruction',
    'Technical Issue',
    'Other',
  ];

  final TextEditingController descController = TextEditingController();

  @override
  void dispose() {
    selectedIssue.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Report an Issue', actions: []),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 4, 18, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Help the transport team resolve problems by\nreporting any issues encountered during the\ntrip.',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: figtree,
                  color: const Color(0xFF6B7280),
                ),
              ),

              const SizedBox(height: 24),

              /// BREAKDOWN
              Text(
                'BREAKDOWN',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  fontFamily: figtree,
                  color: const Color(0xFF1A1A2E),
                ),
              ),

              const SizedBox(height: 10),

              ValueListenableBuilder(
                valueListenable: selectedIssue,
                builder: (context, value, _) {
                  final bool isSelected = value == "breakdown";

                  return GestureDetector(
                    onTap: () => selectedIssue.value = "breakdown",
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFFFF5F5)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFFE53935)
                              : const Color(0xFFE5E7EB),
                          width: isSelected ? 1.5 : 1,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            margin: const EdgeInsets.only(top: 1),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected
                                  ? const Color(0xFFE53935)
                                  : Colors.transparent,
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFFE53935)
                                    : Colors.grey.shade400,
                                width: 1.5,
                              ),
                            ),
                            child: isSelected
                                ? const Icon(
                                    Icons.circle,
                                    size: 9,
                                    color: Colors.white,
                                  )
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
                                    fontFamily: figtree,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: isSelected
                                        ? const Color(0xFFE53935)
                                        : const Color(0xFF1A1A2E),
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  'Only report if bus halted in middle of the journey. This is reported to users and admin.',
                                  style: TextStyle(
                                    fontFamily: figtree,
                                    fontSize: 11.5,
                                    color: const Color(0xFF9E9E9E),
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),

              /// OTHER ISSUES
              Text(
                'OTHER ISSUES',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  fontFamily: figtree,
                  color: const Color(0xFF1A1A2E),
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 12),

              ValueListenableBuilder(
                valueListenable: selectedIssue,
                builder: (context, value, _) {
                  return Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: otherIssues.map((issue) {
                      final bool isSelected = value == issue;

                      return GestureDetector(
                        onTap: () => selectedIssue.value = issue,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 180),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
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
                              fontFamily: figtree,
                              fontSize: 14,
                              fontWeight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              color: isSelected
                                  ? const Color(0xFFE53935)
                                  : const Color(0xFF4B5563),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                },
              ),

              const SizedBox(height: 26),

              /// DESCRIPTION
              Text(
                'DESCRIPTION',
                style: TextStyle(
                  fontFamily: figtree,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF111827),
                ),
              ),

              const SizedBox(height: 10),

              Container(
                height: 140,
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
                ),
                child: TextField(
                  controller: descController,
                  maxLines: null,
                  expands: true,
                  style: TextStyle(
                    fontFamily: figtree,
                    fontSize: 14,
                    color: const Color(0xFF111827),
                  ),
                  decoration: InputDecoration(
                    hintText: 'Briefly describe what happened...',
                    hintStyle: TextStyle(
                      fontFamily: figtree,
                      fontSize: 14,
                      color: const Color(0xFF9CA3AF),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
              ),

              const SizedBox(height: 26),

              Text(
                'EVIDENCE',
                style: TextStyle(
                  fontFamily: figtree,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF111827),
                ),
              ),

              const SizedBox(height: 10),
              DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  radius: Radius.circular(16),
                  dashPattern: [6, 4],
                  strokeWidth: 1.5,
                  color: Color(0xFFD1D5DB),
                ),
                child: Container(
                  width: double.infinity,
                  height: 130,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9FAFB),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xffF3F4F6),
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          size: 22,
                          color: Color(0xFF6B7280),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        'Upload Photo',
                        style: TextStyle(
                          fontFamily: figtree,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAppButton(
                text: "Submit Report",
                onPlusTap: () {
                  context.push('/report_submit');
                },
              ),

              const SizedBox(height: 10),

              Center(
                child: TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    'Cancel',
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
