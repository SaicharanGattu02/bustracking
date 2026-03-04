import 'package:bustracking/utils/AppThemeData.dart';
import 'package:bustracking/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_routes/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return MaterialApp.router(
        title: 'Bus Tracking',
        theme: AppTheme.lightTheme(),
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
    );
  }
}