import 'package:bustracking/Components/CustomAppBar.dart';
import 'package:bustracking/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class TripSummary extends StatefulWidget {
  final String tripId;
  const TripSummary({super.key, required this.tripId});

  @override
  State<TripSummary> createState() => _TripSummaryState();
}

class _TripSummaryState extends State<TripSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: CustomAppBar(title: "Trip Summary", actions: []),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// SUCCESS ICON
              Center(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/success.svg",
                      width: 96,
                      height: 96,
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Trip Successfully\nCompleted',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: figtree,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF000000),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// BUS INFO CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xffF8FAFC),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xffF3F4F6)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "BUS",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: figtree,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff9CA3AF),
                          ),
                        ),
                        Text(
                          "KA-05-1234",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: figtree,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff111827),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    const Divider(height: 1, color: Color(0xffE5E7EB)),
                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "ROUTE",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: figtree,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff9CA3AF),
                          ),
                        ),
                        Text(
                          "North Campus Express",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: figtree,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff111827),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    const Divider(height: 1, color: Color(0xffE5E7EB)),
                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "MODE",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: figtree,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff9CA3AF),
                          ),
                        ),
                        Text(
                          "Morning Pickup",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: figtree,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xff111827),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'Trip Details',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: figtree,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF000000),
                ),
              ),

              const SizedBox(height: 14),

              /// TRIP DETAILS CARD
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xffE5E7EB)),
                ),
                child: Column(
                  children: [
                    /// START / END / DURATION
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 22, 20, 22),
                      child: Row(
                        children: [
                          /// START
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "START",
                                  style: TextStyle(
                                    fontFamily: figtree,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xff9CA3AF),
                                    letterSpacing: 1,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "07:30 AM",
                                  style: TextStyle(
                                    fontFamily: figtree,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            width: 1,
                            height: 40,
                            color: const Color(0xffE5E7EB),
                          ),

                          /// END
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "END",
                                    style: TextStyle(
                                      fontFamily: figtree,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff9CA3AF),
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "08:15 AM",
                                    style: TextStyle(
                                      fontFamily: figtree,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            width: 1,
                            height: 40,
                            color: const Color(0xffE5E7EB),
                          ),

                          /// DURATION
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "DURATION",
                                    style: TextStyle(
                                      fontFamily: figtree,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xff9CA3AF),
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    "45m",
                                    style: TextStyle(
                                      fontFamily: figtree,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                      color: const Color(0xff000000),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(height: 1, color: const Color(0xffE5E7EB)),

                    /// TOTAL STOPS / COVERED
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.flag_outlined,
                                      size: 16,
                                      color: Color(0xff9CA3AF),
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      "TOTAL STOPS",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff9CA3AF),
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "45",
                                  style: TextStyle(
                                    fontFamily: figtree,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Icon(
                                      Icons.check_circle,
                                      size: 16,
                                      color: Color(0xff22C55E),
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      "COVERED",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff9CA3AF),
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  "42",
                                  style: TextStyle(
                                    fontFamily: figtree,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                    color: const Color(0xff000000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(height: 1, color: const Color(0xffE5E7EB)),

                    /// MISSED STOPS
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
                      decoration: const BoxDecoration(
                        color: Color(0xffF9FAFB),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xffFEE2E2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.location_off,
                              size: 20,
                              color: Color(0xffEF4444),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "MISSED STOPS",
                                style: TextStyle(
                                  fontFamily: figtree,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff9CA3AF),
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "3",
                                style: TextStyle(
                                  fontFamily: figtree,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: const Color(0xff000000),
                                ),
                              ),
                            ],
                          ),

                          const Spacer(),

                          GestureDetector(
                            onTap: () {
                              context.push('/missed_trips');
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 22,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: const Color(0xffFCA5A5),
                                ),
                                color: const Color(0xffFFFFFF),
                              ),
                              child: Text(
                                "VIEW",
                                style: TextStyle(
                                  fontFamily: figtree,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xffEF4444),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              /// CONFIRM BUTTON
              Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFE5E7EB),
                    width: 1.5,
                  ),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Confirm & Finish',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Color(0xFF1A1A2E),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
