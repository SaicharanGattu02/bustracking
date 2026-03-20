import 'package:bustracking/utils/constants.dart';
import 'package:flutter/material.dart';
import '../../core/theme/ThemeHelper.dart';
import '../../utils/media_query_helper.dart';

class NotificationPermission extends StatefulWidget {
  const NotificationPermission({super.key});

  @override
  State<NotificationPermission> createState() =>
      _NotificationPermissionState();
}

class _NotificationPermissionState extends State<NotificationPermission> {
  Widget alertItem(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              color: const Color(0xffFEE2E2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.red, size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:  TextStyle(
                    fontFamily: figtree,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Color(0xff111827),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style:  TextStyle(
                    fontFamily: figtree,
                    fontSize: 12,
                    color: Color(0xff6B7280),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ThemeHelper.isDarkMode(context);

    return Scaffold(
      backgroundColor: ThemeHelper.backgroundColor(context),
      body: SafeArea(
        child: Column(
          children: [

            /// TOP IMAGE
            Image.asset(
              "assets/bg/notification_bg.png",
              width: double.infinity,
              height: SizeConfig.screenHeight * 0.28,
              fit: BoxFit.cover,
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// TITLE
                    Text(
                      "Stay Updated About Your\nChild’s Bus",
                      style: TextStyle(
                        fontFamily: figtree,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                        color: isDark ? Colors.white : const Color(0xff111827),
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// SUBTITLE
                    Text(
                      "Don't miss a stop. Get real-time updates for peace of mind.",
                      style: TextStyle(
                        fontFamily: figtree,
                        fontSize: 14,
                        height: 1.5,
                        color: isDark
                            ? Colors.white70
                            : const Color(0xff6B7280),
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// ALERT CARD
                    Container(
                      padding: const EdgeInsets.all(22),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: const Color(0xffE5E7EB)),
                      ),
                      child: Column(
                        children: [
                          alertItem(
                            Icons.notifications_active_outlined,
                            "Bus Arrival Alerts",
                            "Know exactly when the bus reaches the stop",
                          ),
                          alertItem(
                            Icons.play_circle_outline,
                            "Trip Started",
                            "Get notified when the journey begins",
                          ),
                          alertItem(
                            Icons.check_circle_outline,
                            "Drop Completed",
                            "Instant update upon safe arrival",
                          ),
                          alertItem(
                            Icons.warning_amber_outlined,
                            "Breakdown Alerts",
                            "Immediate info on unexpected delays",
                          ),
                        ],
                      ),
                    ),

                    const Spacer(),

                    /// ENABLE BUTTON
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffEF1111),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Enable Notifications",
                          style: TextStyle(
                            fontFamily: figtree,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    /// MAYBE LATER
                    Center(
                      child: Text(
                        "Maybe Later",
                        style: TextStyle(
                          fontFamily: figtree,
                          fontSize: 14,
                          color: isDark
                              ? Colors.white70
                              : const Color(0xff9CA3AF),
                        ),
                      ),
                    ),

                    SizedBox(height: SizeConfig.screenHeight * 0.02),
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