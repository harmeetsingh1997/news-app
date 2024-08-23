
import 'package:news_app/Domain/entities/news_entities.dart';

import '../entities/some_root_entity.dart';

abstract class NewsRepository {
  Future<NewsEntity> fetchNews();
  Future<SomeRootEntity> fetchPopular();
}
