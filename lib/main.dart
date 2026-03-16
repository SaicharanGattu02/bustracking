import 'dart:async';
import 'package:bustracking/services/SecureStorageService.dart';
import 'package:bustracking/state_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_routes/router.dart';

Future<void> main() async {
  final storage = SecureStorageService.instance;
  final themeCubit = ThemeCubit(storage);
  await themeCubit.hydrate();
  runApp(
    MultiRepositoryProvider(
      providers: StateInjector.repositoryProviders,
      child: MultiBlocProvider(
        providers: StateInjector.blocProviders(themeCubit),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleQuickAction();
    });
  }

  Future<void> _handleQuickAction() async {
    final action = QuickActionService.pendingAction;

    if (action == null) return;

    final token = await AuthService.getAccessToken();

    if (token == null || token.isEmpty) {
      appRouter.go('/dashboard');
      QuickActionService.pendingAction = null;
      return;
    }

    switch (action) {
      case 'sell':
        _navigate('/seller_categories');
        break;

      case 'buy':
        _navigate('/dashboard');
        break;

      case 'chat':
        _navigate('/chat');
        break;
    }

    QuickActionService.pendingAction = null;
  }

  void _navigate(String route) {
    appRouter.go('/dashboard');

    Future.delayed(const Duration(milliseconds: 100), () {
      if (route != '/dashboard') {
        appRouter.push(route);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return ValueListenableBuilder<bool>(
      valueListenable: serverDownNotifier,
      builder: (context, isServerDown, _) {
        if (isServerDown) {
          return const ServerDownScreen();
        }
        return BlocBuilder<ThemeCubit, AppThemeMode>(
          builder: (context, appThemeMode) {
            final themeMode = switch (appThemeMode) {
              AppThemeMode.light => ThemeMode.light,
              AppThemeMode.dark => ThemeMode.dark,
              _ => ThemeMode.system,
            };
            return StateInjector.withAuthBlocs(
              child: MaterialApp.router(
                scaffoldMessengerKey: scaffoldMessengerKey,
                title: 'Sympl',
                theme: AppTheme.getLightTheme(),
                darkTheme: AppTheme.getDarkTheme(),
                themeMode: themeMode,
                debugShowCheckedModeBanner: false,
                routerConfig: appRouter,
              ),
            );
          },
        );
      },
    );
  }
}
