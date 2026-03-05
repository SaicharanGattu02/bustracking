import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/color_constants.dart';
import '../utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? color;
  final List<Widget> actions;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.actions,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color ?? Colors.white,
      centerTitle: true,
      leading: IconButton(
        visualDensity: VisualDensity.compact,
        onPressed: () {
          context.pop(true);
        },
        icon: const Icon(Icons.arrow_back, size: 24, color: Color(0xff0F172A)),
      ),
      title: Text(
        title,
        style:  TextStyle(
          color: Color(0xff111827),
          fontSize: 18,fontFamily: figtree,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
