import 'package:bustracking/Components/CustomAppBar.dart';
import 'package:bustracking/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TripData {
  final String title;
  final String date;
  final String departure;
  final String arrival;
  final String duration;
  final bool isHomeToSchool;

  const TripData({
    required this.title,
    required this.date,
    required this.departure,
    required this.arrival,
    required this.duration,
    required this.isHomeToSchool,
  });
}

class TripHistory extends StatelessWidget {
  const TripHistory({super.key});

  static const List<TripData> trips = [
    TripData(
      title: 'Home to School',
      date: 'Yesterday, Oct 23',
      departure: '07:45\nAM',
      arrival: '08:27\nAM',
      duration: '42 min',
      isHomeToSchool: true,
    ),
    TripData(
      title: 'Home to School',
      date: 'Yesterday, Oct 23',
      departure: '07:45\nAM',
      arrival: '08:27\nAM',
      duration: '42 min',
      isHomeToSchool: true,
    ),
    TripData(
      title: 'Home to School',
      date: 'Yesterday, Oct 23',
      departure: '07:45\nAM',
      arrival: '08:27\nAM',
      duration: '42 min',
      isHomeToSchool: true,
    ),
    TripData(
      title: 'School to Home',
      date: 'Yesterday, Oct 23',
      departure: '15:40\nPM',
      arrival: '16:25\nPM',
      duration: '45 min',
      isHomeToSchool: false,
    ),
    TripData(
      title: 'Home to School',
      date: 'Monday, Oct 21',
      departure: '07:50\nAM',
      arrival: '08:35\nAM',
      duration: '45 min',
      isHomeToSchool: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFC),
      appBar: CustomAppBar(title:  "Trip History", actions: []),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Trips",
              style: TextStyle(
                fontSize: 20,
                fontFamily: figtree,
                fontWeight: FontWeight.w700,
                color: Color(0xff111827),
              ),
            ),
            Row(
              spacing: 16,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0x01FFFFFF), // #FFFFFF01
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xffE2E8F0)),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TOTAL TRIPS",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: figtree,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff6B7280),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "42",
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: figtree,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff111827),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "+4 this week",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: figtree,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff22C55E),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0x01FFFFFF), // #FFFFFF01
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xffE2E8F0)),
                    ),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "TOTAL DRIVING",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: figtree,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff6B7280),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "72h",
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: figtree,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff111827),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "13h this week",
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: figtree,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff22C55E),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Text(
              "Last 5 Trips",
              style: TextStyle(
                fontSize: 20,
                fontFamily: figtree,
                fontWeight: FontWeight.w700,
                color: Color(0xff111827),
              ),
            ),
            SizedBox(height: 18),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final trip = trips[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: GestureDetector(
                          onTap: () {
                            context.push('/trip_summary?tripId=${2}');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xffF3F4F6),
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF3F4F6),
                                        borderRadius: BorderRadius.circular(
                                          1000,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.school,
                                        size: 18,
                                        color: Color(0xff475569),
                                      ),
                                    ),

                                    const SizedBox(width: 10),

                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          trip.title,
                                          style: TextStyle(
                                            fontFamily: figtree,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: Color(0xff111827),
                                          ),
                                        ),
                                        Text(
                                          trip.date,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: figtree,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff6B7280),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 16),

                                Container(
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: Color(0xffF9FAFB),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Departure",
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontFamily: figtree,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff6B7280),
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            trip.departure,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff111827),
                                              fontFamily: figtree,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  // Icon(
                                                  //   Icons.arrow_forward,
                                                  //   size: 14,
                                                  //   color: Color(0xff94A3B8),
                                                  // ),
                                                  // SizedBox(height: 20,),
                                                  Container(
                                                    height: 1,
                                                    color: const Color(
                                                      0xffE2E8F0,
                                                    ),
                                                  ),
                                                ],
                                              ),

                                              const SizedBox(height: 4),

                                              Text(
                                                trip.duration,
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  color: Color(0xff64748B),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Arrival",
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontFamily: figtree,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff6B7280),
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            trip.arrival,
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xff111827),
                                              fontFamily: figtree,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }, childCount: trips.length),
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
