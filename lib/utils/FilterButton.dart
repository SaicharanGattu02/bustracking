import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const FilterButton({
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 18), // Dynamic width
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: isSelected
            ? null
            : Border.all(
          color: const Color(0xff625C5C),
          width: 1,
        ),
        gradient: isSelected
            ? const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFF5102),
            Color(0xFFFDA42E),
          ],
        )
            : null,
        color: isSelected ? null : Colors.transparent,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ).copyWith(
          overlayColor: MaterialStateProperty.all(
            Colors.white.withOpacity(0.05),
          ),
        ),
        child: Text(textAlign: TextAlign.center,
          text,
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Roboto',
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xff666666),
          ),
        ),
      ),
    );
  }
}
