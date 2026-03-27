import 'package:bustracking/utils/color_constants.dart';
import 'package:bustracking/utils/constants.dart';
import 'package:bustracking/utils/media_query_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../Components/CustomAppButton.dart';
import '../../core/theme/ThemeHelper.dart';

class ActivateTransportAccess extends StatefulWidget {
  final String phoneNumber; // e.g. "9876543210"

  const ActivateTransportAccess({super.key, required this.phoneNumber});

  @override
  State<ActivateTransportAccess> createState() =>
      _ActivateTransportAccessState();
}

class _ActivateTransportAccessState extends State<ActivateTransportAccess> {
  final TextEditingController _codeController = TextEditingController();

  final ValueNotifier<String?> _errorNotifier = ValueNotifier<String?>(null);

  @override
  void dispose() {
    _codeController.dispose();
    _errorNotifier.dispose();
    super.dispose();
  }

  void _onActivatePressed() {
    final code = _codeController.text.trim();

    if (code.isEmpty) {
      _errorNotifier.value = "Please enter the activation code";
      return;
    }

    _errorNotifier.value = null;

    // Simulate activation
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      context.go('/select_boarding_point');
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ThemeHelper.isDarkMode(context);
    final maskedPhone =
        "+91 ******${widget.phoneNumber.substring(widget.phoneNumber.length - 4)}";

    return Scaffold(
      backgroundColor: ThemeHelper.backgroundColor(context),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: isDark ? Colors.white : Colors.black87,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Title
              Text(
                "Activate Transport Access",
                style: TextStyle(
                  fontFamily: figtree,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : Color(0xff0F172A),
                ),
              ),

              const SizedBox(height: 8),

              // Subtitle
              Text(
                "Enter the unique code sent to your registered mobile number.",
                style: TextStyle(
                  fontFamily: figtree,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: isDark
                      ? Colors.white.withOpacity(0.70)
                      : const Color(0xff64748B),
                ),
              ),

              const SizedBox(height: 32),

              // Registered Number Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    // Phone Icon Circle
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.white.withOpacity(0.1)
                            : primaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.phone_iphone_rounded,
                        color: primaryColor,
                        size: 28,
                      ),
                    ),

                    const SizedBox(width: 16),

                    // Phone Number
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "REGISTERED NUMBER",
                            style: TextStyle(
                              fontFamily: inter,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: isDark
                                  ? Colors.white70
                                  : const Color(0xff94A3B8),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            maskedPhone,
                            style: TextStyle(
                              fontFamily: inter,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: ThemeHelper.textColor(context),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffBBF7D0), width: 1),
                        color: const Color(0xffDCFCE7).withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "VERIFIED",
                        style: TextStyle(
                          fontFamily: inter,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff15803D),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              TextField(
                controller: _codeController,
                keyboardType: TextInputType.visiblePassword,
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.characters,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]')),
                ],
                style: TextStyle(
                  fontFamily: inter,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 8,
                  color: ThemeHelper.textColor(context),
                ),
                decoration: InputDecoration(
                  hintText: "ENTER CODE",
                  hintStyle: TextStyle(
                    fontFamily: inter,
                    fontSize: 16,
                    color: isDark ? Colors.white38 : Colors.grey[400],
                    letterSpacing: 4,
                  ),
                  suffixIcon: const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(Icons.key_outlined, color: Color(0xff94A3B8)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 18),
                ),
              ),
              const SizedBox(height: 8),

              // Note
              Text(
                "This code was sent to you by your institution.",
                style: TextStyle(
                  fontFamily: inter,
                  fontSize: 13,
                  color: isDark ? Colors.white60 : const Color(0xff64748B),
                ),
              ),

              ValueListenableBuilder<String?>(
                valueListenable: _errorNotifier,
                builder: (context, error, _) => error != null
                    ? Text(
                        error,
                        style: const TextStyle(color: Colors.red, fontSize: 13),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(16, 10, 16, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 23,
            children: [
              CustomAppButton(
                text: "Activate",
                textcolor: Colors.white,
                onPlusTap: () {
                  _onActivatePressed();
                },
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: figtree,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isDark
                        ? Colors.white.withOpacity(0.70)
                        : const Color(0xff475569),
                  ),
                  children: [
                    const TextSpan(text: "Didn’t receive a code? "),
                    TextSpan(
                      text: "Contact Institution",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          print("Phone tapped");
                          // your action here
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
