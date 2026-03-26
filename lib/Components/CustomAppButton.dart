import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/color_constants.dart';

import 'package:flutter/material.dart';

import '../utils/constants.dart';

import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  final String text;
  final Color? textcolor;
  final double? width;
  final double? height;
  final double? textSize;
  final VoidCallback? onPlusTap;
  final IconData? icon;
  final bool isLoading;
  final int? radius;

  final List<Color>? gradientColors;
  final Color? shadowColor;

  const CustomAppButton({
    Key? key,
    required this.text,
    required this.onPlusTap,
    this.textcolor,
    this.height,
    this.width,
    this.textSize,
    this.isLoading = false,
    this.icon,
    this.radius,
    this.gradientColors,
    this.shadowColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = width ?? MediaQuery.of(context).size.width;
    final double buttonHeight = height ?? 56;
    final int borderRadius = radius ?? 16;

    final theme = Theme.of(context);

    final Color textColor = textcolor ?? theme.colorScheme.onPrimary;

    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: Container(
        decoration: BoxDecoration(
           color: onPlusTap == null ? Color(0xffF8FAFC) : primaryColor,
          borderRadius: BorderRadius.circular(borderRadius.toDouble()),
          boxShadow: shadowColor != null
              ? [
                  BoxShadow(
                    color: shadowColor!,
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: ElevatedButton(
          onPressed: isLoading ? null : onPlusTap,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius.toDouble()),
            ),
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      color: textColor,
                      strokeWidth: 2,
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        text,
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: textColor,
                          fontSize: textSize ?? 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (icon != null) ...[
                        const SizedBox(width: 8),
                        Icon(icon, color: textColor, size: 18),
                      ],
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final IconData? icon;
  final bool isLoading;
  final int? radius;
  final Color? bgColor;
  final Color? borderColor;

  const CustomOutlinedButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.textColor,
    this.width,
    this.height,
    this.icon,
    this.isLoading = false,
    this.radius,
    this.bgColor,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final double buttonWidth = width ?? MediaQuery.of(context).size.width;
    final double buttonHeight = height ?? 56;
    final int borderRadius = radius ?? 16;

    final Color finalTextColor =
        textColor ?? theme.colorScheme.primary;

    final Color finalBgColor =
        bgColor ?? theme.colorScheme.surface;

    final Color finalBorderColor =
        borderColor ?? theme.dividerColor;

    return SizedBox(
      width: buttonWidth,
      height: buttonHeight,
      child: Container(
        decoration: BoxDecoration(
          color: finalBgColor,
          borderRadius: BorderRadius.circular(borderRadius.toDouble()),
          border: Border.all(
            color: finalBorderColor,
            width: 1.5,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius.toDouble()),
          child: InkWell(
            onTap: isLoading ? null : onTap,
            borderRadius: BorderRadius.circular(borderRadius.toDouble()),
            child: Center(
              child: isLoading
                  ? SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: finalTextColor,
                ),
              )
                  : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: finalTextColor,
                    ),
                  ),
                  if (icon != null) ...[
                    const SizedBox(width: 8),
                    Icon(icon, size: 20, color: finalTextColor),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
