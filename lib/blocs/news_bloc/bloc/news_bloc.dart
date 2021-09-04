import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news_app/models/articleModel.dart';
import 'package:news_app/repositories/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepository newsRepository;

  NewsBloc({required NewsState initialState, required this.newsRepository})
      : super(NewsInitial()) {
    add(StartEvent());
  }
  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is StartEvent) {
      try {
        List<ArticleModel> _articleList = [];
        print("hello");
        yield NewsLoadingState();
        _articleList = await newsRepository.fetchnews();
        print(_articleList[0]);
        print("state over");
        yield NewsLoadedState(articleList: _articleList);
      } catch (e) {
        yield NewsErrorState(errorMessage: e.toString());
      }
    }
  }
}
