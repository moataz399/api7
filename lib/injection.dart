
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'business_logic/user_cubit.dart';
import 'data/repository/user_repo.dart';
import 'data/web_services/web_services.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<UserCubit>(() => UserCubit(getIt()));
  getIt.registerLazySingleton<UserRepo>(() => UserRepo(getIt()));
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetupDio()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  dio
    ..options.connectTimeout = 10* 1000
    ..options.receiveTimeout = 10 * 1000;

  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    requestHeader: false,
    error: true,
    responseHeader: false,
    request: true,
    responseBody: true,
  ));
  return dio;
}
