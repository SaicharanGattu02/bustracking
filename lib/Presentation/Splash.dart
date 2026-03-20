import 'package:bustracking/utils/constants.dart';
import 'package:bustracking/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/theme/ThemeHelper.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    final isDark = ThemeHelper.isDarkMode(context);
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      backgroundColor: ThemeHelper.backgroundColor(context),
      body: Container(
        height: SizeConfig.screenHeight,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg/splash_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [

            /// CENTER LOGO
            Center(
              child: SvgPicture.asset(
                "assets/icons/logo.svg",
                width: 120,
              ),
            ),

            /// BOTTOM LOADING
            Positioned(
              bottom: SizeConfig.screenHeight * 0.1,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      valueColor: AlwaysStoppedAnimation<Color>(primary),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Loading transport services...",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: figtree,
                      color: isDark ? Colors.white : const Color(0xff666666),
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}