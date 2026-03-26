import 'package:bustracking/utils/color_constants.dart';
import 'package:bustracking/utils/constants.dart';
import 'package:bustracking/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/theme/ThemeHelper.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  final List<OnboardingItem> onboardingData = [
    OnboardingItem(
      image: "assets/images/on_boarding_1.png",
      title: "Track Your School Bus",
      description:
          "Know exactly where the bus is in real time and stay ready for pickup and drop.",
    ),
    OnboardingItem(
      image: "assets/images/on_boarding_2.png",
      title: "Never Miss Your Pickup",
      description:
          "Get notified when the bus is approaching your pickup point so you're always ready.",
    ),
    OnboardingItem(
      image: "assets/images/on_boarding_3.png",
      title: "Safe Journey Monitoring",
      description:
          "Track the trip until the destination and know when the student arrives safely.",
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_pageListener);
  }

  void _pageListener() {
    final page = _pageController.page?.round() ?? 0;
    if (page != _currentPageNotifier.value) {
      _currentPageNotifier.value = page;
    }
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    _currentPageNotifier.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPageNotifier.value < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOutCubic,
      );
    } else {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ThemeHelper.isDarkMode(context);

    // Safe screen size fallback
    final screenHeight = SizeConfig.screenHeight > 0
        ? SizeConfig.screenHeight
        : MediaQuery.of(context).size.height;

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
        child: SafeArea(
          child: Column(
            children: [

              SizedBox(
                height: screenHeight * 0.56,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    _currentPageNotifier.value = index;
                  },
                  itemBuilder: (context, index) {
                    final item = onboardingData[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image Card
                          ClipRRect(
                            borderRadius: BorderRadius.circular(28),
                            child: Image.asset(
                              item.image,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(
                                    Icons.image_not_supported,
                                    size: 80,
                                  ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Title
                          Text(
                            item.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: interBold,
                              fontSize: 26,
                              fontWeight: FontWeight.w700,
                              color: ThemeHelper.textColor(context),
                            ),
                          ),

                          const SizedBox(height: 12),

                          // Description
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50.0),
                            child: Text(
                              item.description,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: inter,
                                fontSize: 15,
                                color: isDark
                                    ? Colors.white.withOpacity(0.78)
                                    : const Color(0xff666666),
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 24,),
              ValueListenableBuilder<int>(
                valueListenable: _currentPageNotifier,
                builder: (context, currentPage, child) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      onboardingData.length,
                          (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.only(right: 8),
                        height: 7,
                        width: currentPage == index ? 26 : 7,
                        decoration: BoxDecoration(
                          color: currentPage == index
                              ? primaryColor
                              : (isDark ? Colors.white24 : Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(28, 20, 28, 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    TextButton(
                      onPressed: () => context.go('/login'),
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.grey[700],
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    ValueListenableBuilder<int>(
                      valueListenable: _currentPageNotifier,
                      builder: (context, currentPage, child) {
                        final isLastPage =
                            currentPage == onboardingData.length - 1;

                        return ElevatedButton(
                          onPressed: _nextPage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 36,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 2,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                isLastPage ? "Get Started" : "Next",
                                style: const TextStyle(
                                  fontSize: 16.5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Icon(
                                isLastPage
                                    ? Icons.check_rounded
                                    : Icons.arrow_forward_rounded,
                                size: 22,
                              ),
                            ],
                          ),
                        );
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

// Data Model
class OnboardingItem {
  final String image;
  final String title;
  final String description;

  OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}
