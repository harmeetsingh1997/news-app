
import 'package:news_app/Domain/entities/news_entities.dart';
import '../../../Domain/entities/some_root_entity.dart';

abstract class NewsState{}


class InitialNewsState extends NewsState{}

class LoadedNewsState extends NewsState{

  final NewsEntity news;


  LoadedNewsState(this.news,);
}
class LoadPopularNewsState extends NewsState{
  final SomeRootEntity someRootEntity;

  LoadPopularNewsState(this.someRootEntity);
}

class ErrorNewsState extends NewsState{

  final String message;

  ErrorNewsState(this.message);
}

