import 'dart:async';
import 'package:bustracking/services/SecureStorageService.dart';
import 'package:bustracking/state_injector.dart';
import 'package:bustracking/utils/media_query_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_routes/router.dart';
import 'core/theme/AppTheme.dart';
import 'core/theme/theme_cubit.dart';

Future<void> main() async {
  final storage = SecureStorageService.instance;
  final themeCubit = ThemeCubit(storage);
  await themeCubit.hydrate();
  runApp(
    // MultiRepositoryProvider(
    //   providers: StateInjector.repositoryProviders,
    //   child:
      MultiBlocProvider(
        providers: StateInjector.blocProviders(themeCubit),
        child: MyApp(),
      ),
    // ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return  BlocBuilder<ThemeCubit, AppThemeMode>(
          builder: (context, appThemeMode) {
            final themeMode = switch (appThemeMode) {
              AppThemeMode.light => ThemeMode.light,
              AppThemeMode.dark => ThemeMode.dark,
              _ => ThemeMode.system,
            };
            return  MaterialApp.router(
                title: 'NAVIGSTER',
                theme: AppTheme.getLightTheme(),
                darkTheme: AppTheme.getDarkTheme(),
                themeMode: themeMode,
                debugShowCheckedModeBanner: false,
                routerConfig: appRouter,
              );

          },
        );

  }
}
