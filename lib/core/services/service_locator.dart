import 'package:bookly_app/core/services/api_service.dart';
import 'package:bookly_app/features/home/data/models/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton<HomeRepoImpl>(
      () => HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));
}
