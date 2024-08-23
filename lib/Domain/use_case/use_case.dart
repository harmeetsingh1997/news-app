
import 'package:news_app/Domain/entities/news_entities.dart';
import 'package:news_app/Domain/entities/some_root_entity.dart';

import '../repository/repo.dart';

class FetchNewsUseCase {
  final NewsRepository repository;

  FetchNewsUseCase(this.repository);

  Future<NewsEntity> call() async {
    return await repository.fetchNews();
  }
}

class FetchPopularUseCase {
  final NewsRepository repository;

  FetchPopularUseCase(this.repository);

  Future<SomeRootEntity> call() async {
    return await repository.fetchPopular();
  }
}
