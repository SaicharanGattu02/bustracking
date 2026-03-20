import 'package:bustracking/Presentation/Splash.dart';
import 'package:bustracking/Presentation/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Presentation/missed_stop_confirmation.dart';
import '../Presentation/report_an_issue.dart';
import '../Presentation/report_received.dart';
import '../Presentation/trip_history.dart';
import '../Presentation/trip_summary.dart';


final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(Splash(), state);
      },
    ),
    GoRoute(
      path: '/trip_history',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(TripHistory(), state);
      },
    ),
    GoRoute(
      path: '/missed_trips',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(MissedStopConfirmation(), state);
      },
    ),
    GoRoute(
      path: '/trip_summary',
      pageBuilder: (context, state) {
        final tripId=state.uri.queryParameters['tripId']??"";
        return buildSlideTransitionPage(TripSummary(tripId: tripId,), state);
      },
    ),
    GoRoute(
      path: '/report_submit',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(ReportSubmit(), state);
      },
    ),
    GoRoute(
      path: '/report_an_issue',
      pageBuilder: (context, state) {
        return buildSlideTransitionPage(ReportAnIssueScreen(), state);
      },
    ),

  ],
  errorBuilder: (context, state) {
    final err = state.error ?? 'Unknown router error';
    return const Scaffold(body: Center(child: Text('Something went wrong')));
  },
);

Page<dynamic> buildSlideTransitionPage(Widget child, GoRouterState state) {
  // if (Platform.isIOS) {
  //   // Use default Cupertino transition on iOS
  //   return CupertinoPage(key: state.pageKey, child: child);
  // }

  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      var offsetAnimation = animation.drive(tween);
      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
