import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField1 extends StatelessWidget {
  final String? hint;
  final String? label;
  final Color? color;
  final Color? lableColor;
  final double? labelFontSize;
  final FontWeight? labelFontWeight;
  final int maxLines;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final bool isRead;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;

  const CommonTextField1({
    super.key,
    this.hint,
    this.color,
    this.lableColor,
    this.label,
    this.maxLines = 1,
    this.controller,
    this.labelFontSize,
    this.labelFontWeight,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.validator,
    this.isRead = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: labelFontWeight ?? FontWeight.w500,
              fontSize: labelFontSize ?? 16,
              color: lableColor ?? Color(0xff1F2937),
            ),
          ),
          SizedBox(height: 8),
        ],
        TextFormField(
          readOnly: isRead,
          inputFormatters: inputFormatters,
          onTap: onTap,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Color(0xff111827),
          ),
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLines: maxLines,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: onChanged,
          validator: validator, // just return error msg here
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xff9CA3AF),
            ),
            filled: true,
            fillColor: color ?? Color(0xffEFEFEF).withOpacity(0.5),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
