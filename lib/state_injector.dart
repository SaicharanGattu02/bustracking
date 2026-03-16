

import 'package:flutter_bloc/flutter_bloc.dart';

class StateInjector {
  static final repositoryProviders = <RepositoryProvider>[
    RepositoryProvider<RemoteDataSource>(
      create: (context) => RemoteDataSourceImpl(),
    ),

  ];

  static List<BlocProvider> blocProviders(ThemeCubit themeCubit) => [
    BlocProvider<InternetStatusBloc>(create: (context) => InternetStatusBloc()),
    BlocProvider<ThemeCubit>.value(value: themeCubit),
    BlocProvider<LocationCubit>(create: (context) => LocationCubit()),

  ];

}
