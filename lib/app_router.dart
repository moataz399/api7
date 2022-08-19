import 'package:api/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/user_cubit.dart';
import 'constants/strings.dart';
import 'injection.dart';

class AppRouter {
  AppRouter() {
    late String initialRoute;
  }
    Route? generateRoute(RouteSettings settings) {
      switch (settings.name) {
        case homeScreen:
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext context) => getIt<UserCubit>(),
                child: const HomeScreen()),
          );
      }
    }
  }

