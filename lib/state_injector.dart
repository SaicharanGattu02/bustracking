

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/internet_status/internet_status_bloc.dart';
import 'core/theme/theme_cubit.dart';

class StateInjector {
  static final repositoryProviders = <RepositoryProvider>[
    // RepositoryProvider<RemoteDataSource>(
    //   create: (context) => RemoteDataSourceImpl(),
    // ),

  ];

  static List<BlocProvider> blocProviders(ThemeCubit themeCubit) => [
    BlocProvider<InternetStatusBloc>(create: (context) => InternetStatusBloc()),
    BlocProvider<ThemeCubit>.value(value: themeCubit),


  ];

}
