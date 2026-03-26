import 'package:bustracking/utils/color_constants.dart';
import 'package:bustracking/utils/constants.dart';
import 'package:bustracking/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import '../../Components/CustomAppButton.dart';
import '../../core/theme/ThemeHelper.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otp extends StatefulWidget {
  final String phoneNumber;

  const Otp({super.key, required this.phoneNumber});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final TextEditingController _pinController = TextEditingController();
  final ValueNotifier<bool> _isValidOtp = ValueNotifier(false);
  final ValueNotifier<String?> _errorNotifier = ValueNotifier<String?>(null);
  final ValueNotifier<int> _resendTimerNotifier = ValueNotifier<int>(30);
  final ValueNotifier<bool> _canResendNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _startResendTimer();
  }

  void _startResendTimer() {
    _resendTimerNotifier.value = 30;
    _canResendNotifier.value = false;

    Future.delayed(const Duration(seconds: 1), _countdown);
  }

  void _countdown() {
    if (!mounted) return;

    if (_resendTimerNotifier.value > 1) {
      _resendTimerNotifier.value--;
      Future.delayed(const Duration(seconds: 1), _countdown);
    } else {
      _resendTimerNotifier.value = 0;
      _canResendNotifier.value = true;
    }
  }

  void _onResendPressed() {
    if (!_canResendNotifier.value) return;

    _errorNotifier.value = null;

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      _startResendTimer();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("OTP resent successfully")));
    });
  }

  void _onVerifyPressed() {
    final otp = _pinController.text.trim();

    if (otp.length != 6) {
      _errorNotifier.value = "Please enter complete 6-digit code";
      return;
    }

    _errorNotifier.value = null;

    // Simulate verification
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      context.go('/home'); // Change to your actual home route
    });
  }

  @override
  void dispose() {
    _isValidOtp.dispose();
    _pinController.dispose();
    _errorNotifier.dispose();
    _resendTimerNotifier.dispose();
    _canResendNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ThemeHelper.isDarkMode(context);
    final primary = primaryColor;

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
              Text(
                "Verify your number",
                style: TextStyle(
                  fontFamily: figtree,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: ThemeHelper.textColor(context),
                ),
              ),

              const SizedBox(height: 8),

              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: figtree,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: isDark
                        ? Colors.white.withOpacity(0.70)
                        : const Color(0xff64748B),
                  ),
                  children: [
                    const TextSpan(text: "We’ve sent a code to "),
                    TextSpan(
                      text: maskedPhone,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? ThemeHelper.textColor(context)
                            : const Color(0xff0F172A),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Pin Code Field
              PinCodeTextField(
                appContext: context,
                length: 6,
                controller: _pinController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                textStyle: TextStyle(
                  fontFamily: inter,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: ThemeHelper.textColor(context),
                ),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  fieldHeight: 56,
                  fieldWidth: 48,
                  activeColor: primary,
                  inactiveColor: isDark
                      ? Colors.white24
                      : const Color(0xffE0E0E0),
                  selectedColor: primary,
                  inactiveFillColor: isDark
                      ? const Color(0xFF1E1E1E)
                      : Colors.white,
                  activeFillColor: isDark
                      ? const Color(0xFF1E1E1E)
                      : Colors.white,
                  selectedFillColor: isDark
                      ? const Color(0xFF1E1E1E)
                      : Colors.white,
                ),
                enableActiveFill: true,
                onChanged: (value) {
                  if (_errorNotifier.value != null) {
                    _errorNotifier.value = null;
                  }

                  _isValidOtp.value = value.length == 6;
                },
                onCompleted: (value) => _onVerifyPressed(),
              ),

              const SizedBox(height: 16),

              // Error Message
              ValueListenableBuilder<String?>(
                valueListenable: _errorNotifier,
                builder: (context, error, _) => error != null
                    ? Text(
                        error,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 13,
                          fontFamily: inter,
                        ),
                      )
                    : const SizedBox.shrink(),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Verify Button
              ValueListenableBuilder<bool>(
                valueListenable: _isValidOtp,
                builder: (context, isValid, child) {
                  return CustomAppButton(
                    text: "Verify",
                    textcolor: isValid ? const Color(0xFFF8FAFC) : Colors.black,
                    onPlusTap: isValid ? _onVerifyPressed : null,
                  );
                },
              ),

              const SizedBox(height: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code? ",
                    style: TextStyle(
                      fontFamily: inter,
                      fontSize: 14,
                      color: isDark ? Colors.white70 : Colors.grey[700],
                    ),
                  ),
                  ValueListenableBuilder<int>(
                    valueListenable: _resendTimerNotifier,
                    builder: (context, seconds, _) {
                      return ValueListenableBuilder<bool>(
                        valueListenable: _canResendNotifier,
                        builder: (context, canResend, _) => GestureDetector(
                          onTap: canResend ? _onResendPressed : null,
                          child: Text(
                            canResend ? "Resend" : "Resend in ${seconds}s",
                            style: TextStyle(
                              fontFamily: inter,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: canResend ? Colors.red : Colors.grey,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
