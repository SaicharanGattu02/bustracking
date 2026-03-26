import 'package:bustracking/Components/CustomAppButton.dart';
import 'package:bustracking/utils/color_constants.dart';
import 'package:bustracking/utils/constants.dart';
import 'package:bustracking/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/ThemeHelper.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // ValueNotifiers
  final ValueNotifier<String?> _errorNotifier = ValueNotifier<String?>(null);
  final ValueNotifier<bool> _isValidPhone = ValueNotifier(false);
  @override
  void dispose() {
    _phoneController.dispose();
    _errorNotifier.dispose();
    super.dispose();
  }

  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your phone number";
    }
    if (value.length != 10) {
      return "Phone number must be exactly 10 digits";
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return "Please enter valid 10-digit number";
    }
    return null;
  }

  void _onContinuePressed() async {
    final phone = _phoneController.text.trim();
    final error = _validatePhone(phone);

    if (error != null) {
      _errorNotifier.value = error;
      return;
    }

    _errorNotifier.value = null;

    // Simulate OTP sending
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;

    // Navigate to OTP Screen
    context.push('/otp?phoneNumber=${phone}');
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ThemeHelper.isDarkMode(context);

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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),

                Text(
                  "Enter your phone number",
                  style: TextStyle(
                    fontFamily: interBold,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: ThemeHelper.textColor(context),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  "We'll send a verification code to continue",
                  style: TextStyle(
                    fontFamily: inter,
                    fontSize: 15,
                    color: isDark
                        ? Colors.white.withOpacity(0.70)
                        : const Color(0xff666666),
                  ),
                ),

                const SizedBox(height: 40),

                // Phone Number Field
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.number,

                  autofocus: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  style: TextStyle(
                    fontFamily: inter,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: ThemeHelper.textColor(context),
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "+91",
                            style: TextStyle(
                              fontFamily: inter,
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: ThemeHelper.textColor(context),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Container(
                            height: 24,
                            width: 1,
                            color: isDark
                                ? Colors.white24
                                : const Color(0xff64748B),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 0,
                      minHeight: 0,
                    ),
                    hintText: "00000 00000",
                    hintStyle: const TextStyle(
                      color: Color(0xffAAAAAA),
                      fontSize: 17,
                    ),
                    errorText: null, // We will show error using ValueNotifier
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: isDark
                            ? Colors.white24
                            : const Color(0xff64748B),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: isDark
                            ? Colors.white24
                            : const Color(0xff64748B),
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: isDark
                            ? Colors.white24
                            : const Color(0xff64748B),
                        width: 1,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                  ),
                  onChanged: (value) {
                    if (_errorNotifier.value != null) {
                      _errorNotifier.value = null;
                    }

                    _isValidPhone.value = value.length == 10;
                  },
                ),

                // Error Message using ValueNotifier
                ValueListenableBuilder<String?>(
                  valueListenable: _errorNotifier,
                  builder: (context, error, child) {
                    return error != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              error,
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 13,
                                fontFamily: inter,
                              ),
                            ),
                          )
                        : const SizedBox(height: 8);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.fromLTRB(16, 10, 16, 20),
          child: ValueListenableBuilder<bool>(
            valueListenable: _isValidPhone,
            builder: (context, isValid, child) {
              return CustomAppButton(
                text: "Continue",
                textcolor: isValid ? const Color(0xFFF8FAFC) : Colors.black,
                onPlusTap: isValid ? _onContinuePressed : null,
              );
            },
          ),
        ),
      ),
    );
  }
}
