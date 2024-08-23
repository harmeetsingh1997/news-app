import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Data/remote_data_source/remote_data_source.dart';
import 'package:news_app/Data/repo_impl/repo_impl.dart';
import 'package:news_app/Domain/repository/repo.dart';
import 'package:news_app/Domain/use_case/use_case.dart';
import 'package:news_app/Presentation/logic_holder/bloc/api_bloc.dart';


final sl = GetIt.instance;

void setupServiceLocator() {
  // Register http.Client
  sl.registerLazySingleton(() => http.Client());

  // Register the Remote Data Source
  sl.registerLazySingleton<NewsRemoteDataSource>(
          () => NewsRemoteDataSourceImpl(sl<http.Client>()));

  // Register the Repository
  sl.registerLazySingleton<NewsRepository>(
          () => NewsRepositoryImpl(sl<NewsRemoteDataSource>()));

  // Register the Use Cases
  sl.registerLazySingleton(() => FetchNewsUseCase(sl<NewsRepository>()));
  sl.registerLazySingleton(() => FetchPopularUseCase(sl<NewsRepository>()));

  // Register the BLoC
  sl.registerFactory(() => NewsBloc(
    fetchNewsUseCase: sl<FetchNewsUseCase>(),
    fetchPopularUseCase: sl<FetchPopularUseCase>(),
  ));
}






