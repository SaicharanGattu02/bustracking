import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../Components/Shimmers.dart';
import '../utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // ── Menu items data ────────────────────────────────────────────────────────
  static const List<Map<String, dynamic>> _menuItems = [
    {
      'title': 'Trip History',
      'subtitle': 'View past trips & stats',
      'svg': 'assets/svg/trip_history.svg',
      'iconColor': Color(0xFF135BEC),
      'bgColor': Color(0xffEFF6FF),
      'route': '/trip_history',
    },
    {
      'title': 'Notifications & Alerts',
      'subtitle': 'Manage app alerts',
      'svg': 'assets/svg/notification.svg',
      'iconColor': Color(0xFFF97316),
      'bgColor': Color(0xffFFF7ED),
      'route': null,
    },
    {
      'title': 'Contact Transport Manager',
      'subtitle': 'Call Support',
      'svg': 'assets/svg/contact_support.svg',
      'iconColor': Color(0xFF16A34A),
      'bgColor': Color(0xffF0FDF4),
      'route': null,
    },
    {
      'title': 'Privacy Policy & Terms',
      'subtitle': 'Legal information',
      'svg': 'assets/svg/privacy_policy.svg',
      'iconColor': Color(0xFF64748B),
      'bgColor': Color(0xffF8FAFC),
      'route': null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0D000000),
                      offset: Offset(0, 1),
                      blurRadius: 2,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: 88,
                            height: 88,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                              Border.all(color: Colors.white, width: 3),
                            ),
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl:
                                'https://randomuser.me/api/portraits/men/32.jpg',
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    shimmerCircle(88, context),
                                errorWidget: (context, url, error) =>
                                const Icon(Icons.person, size: 40),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 2,
                            right: 2,
                            child: Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                color: const Color(0xFF4CAF50),
                                shape: BoxShape.circle,
                                border:
                                Border.all(color: Colors.white, width: 2),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    Text(
                      'Srinivas K',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: figtree,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF0F172A),
                      ),
                    ),

                    const SizedBox(height: 4),
                    Text(
                      'Green Valley School',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: figtree,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF135BEC),
                      ),
                    ),

                    const SizedBox(height: 8),

                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(9999),
                      ),
                      child: Text(
                        'Driver ID: D98216',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: figtree,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF475569),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xffE2E8F0)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Account Details',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: figtree,
                              color: const Color(0xFF0F172A),
                            ),
                          ),
                          SvgPicture.asset(
                            'assets/svg/account_details.svg',
                            width: 20,
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                              Color(0xFF94A3B8),
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Divider(height: 1, color: Color(0xffE2E8F0)),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'FULL NAME',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: figtree,
                              letterSpacing: 1,
                              color: const Color(0xFF64748B),
                            ),
                          ),
                          Text(
                            'Srinivas K',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: figtree,
                              color: const Color(0xFF0F172A),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Divider(height: 1, color: Color(0xffE2E8F0)),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'MOBILE',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: figtree,
                              letterSpacing: 1,
                              color: const Color(0xFF64748B),
                            ),
                          ),
                          Text(
                            '+91 98765 43210',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: figtree,
                              color: const Color(0xFF0F172A),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Divider(height: 1, color: Color(0xffE2E8F0)),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'LICENSE NO',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: figtree,
                              letterSpacing: 1,
                              color: const Color(0xFF64748B),
                            ),
                          ),
                          Text(
                            'KA01-2023DL',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: figtree,
                              color: const Color(0xFF0F172A),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
              sliver: SliverList.builder(
                itemCount: _menuItems.length,
                itemBuilder: (context, index) {
                  final item = _menuItems[index];
                  final String? route = item['route'] as String?;

                  return GestureDetector(
                    onTap: () {
                      if (route != null) context.push(route);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: const Color(0xffF1F5F9), width: 1),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x0D000000),
                            offset: Offset(0, 1),
                            blurRadius: 2,
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Icon container
                          Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: item['bgColor'] as Color,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                item['svg'] as String,
                                width: 18,
                                height: 18,
                                colorFilter: ColorFilter.mode(
                                  item['iconColor'] as Color,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['title'] as String,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: figtree,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xFF0F172A),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  item['subtitle'] as String,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: figtree,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xFF64748B),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Icon(
                            Icons.chevron_right,
                            color: Color(0xFFCBD5E1),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.logout_rounded,
                      color: Color(0xFFE53935),
                      size: 20,
                    ),
                    label: const Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFE53935),
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFF5F5),
                      side: const BorderSide(
                          color: Color(0xFFFFCDD2), width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}