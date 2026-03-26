import 'package:bustracking/utils/constants.dart';
import 'package:bustracking/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../core/theme/ThemeHelper.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _controller.forward();

    // Navigate after delay
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      context.go('/onboarding');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ThemeHelper.isDarkMode(context);
    final primary = Theme.of(context).colorScheme.primary;

    // Safe fallback in case SizeConfig is not initialized yet
    final screenHeight = SizeConfig.screenHeight > 0
        ? SizeConfig.screenHeight
        : MediaQuery.of(context).size.height;

    final screenWidth = SizeConfig.screenWidth > 0
        ? SizeConfig.screenWidth
        : MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ThemeHelper.backgroundColor(context),
      body: Container(
        height: screenHeight,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg/splash_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Overlay for better contrast
            Container(
              color: isDark
                  ? Colors.black.withOpacity(0.38)
                  : Colors.black.withOpacity(0.25),
            ),

            // Logo
            Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: SvgPicture.asset(
                    "assets/svg/logo.svg",
                    width: screenWidth * 0.55,
                    height: screenWidth * 0.55,
                    placeholderBuilder: (context) => const SizedBox(
                      width: 80,
                      height: 80,
                      child: CircularProgressIndicator(strokeWidth: 3),
                    ),
                  ),
                ),
              ),
            ),

            // Bottom Loading
            Positioned(
              bottom: screenHeight * 0.12,
              left: 0,
              right: 0,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primary.withOpacity(0.12),
                      ),
                      child: SizedBox(
                        height: 32,
                        width: 32,
                        child: CircularProgressIndicator(
                          strokeWidth: 3.5,
                          valueColor: AlwaysStoppedAnimation(primary),
                          backgroundColor: primary.withOpacity(0.25),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    Text(
                      "Loading transport services...",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: figtree,
                        color: isDark
                            ? Colors.white.withOpacity(0.95)
                            : const Color(0xff555555),
                        fontWeight: FontWeight.w600,
                        fontSize: 15.5,
                        letterSpacing: 0.3,
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