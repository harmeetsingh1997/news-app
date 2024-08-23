
import 'package:news_app/Domain/entities/news_entities.dart';

import '../../Domain/entities/some_root_entity.dart';
import '../../Domain/repository/repo.dart';
import '../remote_data_source/remote_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl(this.remoteDataSource);

  @override
  Future<NewsEntity> fetchNews() async {
    return await remoteDataSource.fetchNews();
  }

  @override
  Future<SomeRootEntity> fetchPopular() async {
    return await remoteDataSource.fetchPopular();
  }
}
