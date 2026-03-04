import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../Components/Shimmers.dart';
import '../utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
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
                          border: Border.all(color: Colors.white, width: 2),
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
                  color: Color(0xFF0F172A),
                  letterSpacing: 0.2,
                ),
              ),

              const SizedBox(height: 4),
              Text(
                'Green Valley School',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: figtree,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF135BEC),
                ),
              ),

              const SizedBox(height: 6),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF2FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Driver ID: D98216',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF3949AB),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // ── Account Details Card ─────────────────────────────────────
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Account Details',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1A1A2E),
                          ),
                        ),
                        Icon(
                          Icons.edit_outlined,
                          size: 20,
                          color: Colors.grey.shade400,
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    _buildDetailRow('FULL NAME', 'Srinivas K'),
                    const SizedBox(height: 14),
                    _buildDetailRow('MOBILE', '+91 98765 43210'),
                    const SizedBox(height: 14),
                    _buildDetailRow('LICENSE NO', 'KA01-2023DL'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ── Menu Items Card ──────────────────────────────────────────
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildMenuItem(
                      icon: Icons.history_rounded,
                      iconColor: const Color(0xFF1976D2),
                      iconBg: const Color(0xFFE3F2FD),
                      title: 'Trip History',
                      subtitle: 'View past trips & stats',
                      isFirst: true,
                    ),
                    _buildDivider(),
                    _buildMenuItem(
                      icon: Icons.notifications_outlined,
                      iconColor: const Color(0xFFFF9800),
                      iconBg: const Color(0xFFFFF3E0),
                      title: 'Notifications & Alerts',
                      subtitle: 'Manage app alerts',
                    ),
                    _buildDivider(),
                    _buildMenuItem(
                      icon: Icons.headset_mic_outlined,
                      iconColor: const Color(0xFF4CAF50),
                      iconBg: const Color(0xFFE8F5E9),
                      title: 'Contact Transport Manager',
                      subtitle: 'Call Support',
                    ),
                    _buildDivider(),
                    _buildMenuItem(
                      icon: Icons.shield_outlined,
                      iconColor: const Color(0xFF7E57C2),
                      iconBg: const Color(0xFFEDE7F6),
                      title: 'Privacy Policy & Terms',
                      subtitle: 'Legal information',
                      isLast: true,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── Logout Button ─────────────────────────────────────────────
              SizedBox(
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
                      color: Color(0xFFFFCDD2),
                      width: 1.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Color(0xFF9E9E9E),
            letterSpacing: 0.8,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A2E),
          ),
        ),
      ],
    );
  }

  // ── Helper: Menu Item ─────────────────────────────────────────────────────
  Widget _buildMenuItem({
    required IconData icon,
    required Color iconColor,
    required Color iconBg,
    required String title,
    required String subtitle,
    bool isFirst = false,
    bool isLast = false,
  }) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.vertical(
        top: isFirst ? const Radius.circular(16) : Radius.zero,
        bottom: isLast ? const Radius.circular(16) : Radius.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: iconColor, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              color: Colors.grey.shade400,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }

  // ── Helper: Thin Divider ──────────────────────────────────────────────────
  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      indent: 74,
      endIndent: 18,
      color: Colors.grey.shade100,
    );
  }
}
