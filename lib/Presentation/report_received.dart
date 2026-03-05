import 'package:bustracking/Components/CustomAppButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../utils/constants.dart';

class ReportSubmit extends StatefulWidget {
  const ReportSubmit({super.key});

  @override
  State<ReportSubmit> createState() => _ReportSubmitState();
}

class _ReportSubmitState extends State<ReportSubmit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              SvgPicture.asset(
                "assets/svg/reportbg.svg",
                width: 190,
                height: 190,
              ),

              const SizedBox(height: 32),

              Text(
                "We've Received Your Report",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: figtree,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF000000),
                ),
              ),

              const SizedBox(height: 12),
              Text(
                'Thank you for notifying us. The\ntransport administration team has\nbeen alerted.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF6B7280),
                  fontFamily: figtree,
                ),
              ),

              const SizedBox(height: 32),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: Color(0xffF8FAFC),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Color(0xFFF3F4F6), width: 1),
                ),
                child: Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 38,
                          height: 38,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFEBEB),
                            shape: BoxShape.circle,

                          ),
                          child: const Icon(
                            Icons.directions_bus_rounded,
                            color: Color(0xFFE53935),
                            size: 20,
                          ),
                        ),
                        Positioned(
                          bottom: -2,
                          right: -2,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE53935),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.warning_rounded,
                              color: Colors.white,
                              size: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 14),
                    // Category label + value
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CATEGORY',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: figtree,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff9CA3AF),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Breakdown reported',
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: figtree,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF111827),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      "assets/svg/check.svg",
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
              ),
              const Spacer(flex: 3),
              CustomAppButton(
                text: 'View Summary',
                onPlusTap: () {
                  context.push('/trip_history');
                },
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
