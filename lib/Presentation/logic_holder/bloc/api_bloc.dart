
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Presentation/logic_holder/bloc/api_event.dart';
import 'package:news_app/Presentation/logic_holder/bloc/api_state.dart';


import '../../../Domain/use_case/use_case.dart';

class NewsBloc extends Bloc<NewsApi, NewsState> {
  final FetchNewsUseCase fetchNewsUseCase;
  final FetchPopularUseCase fetchPopularUseCase;

  NewsBloc({
    required this.fetchNewsUseCase,
    required this.fetchPopularUseCase,
  }) : super(InitialNewsState()) {
    on<NewsFetchApi>((event, emit) async {
      emit(InitialNewsState());
      try {
        final news = await fetchNewsUseCase();
        emit(LoadedNewsState(news));
      } catch (e) {
        emit(ErrorNewsState(e.toString()));
      }
    });

    on<FetchPopular>((event, emit) async {
      try {
        final fetchPopular = await fetchPopularUseCase();
        emit(LoadPopularNewsState(fetchPopular));
      } catch (e) {
        emit(ErrorNewsState(e.toString()));
      }
    });
  }
}
