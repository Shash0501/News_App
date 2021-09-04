part of 'news_bloc.dart';

@immutable
abstract class NewsState extends Equatable {}

class NewsInitial extends NewsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class NewsInitState extends NewsState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class NewsLoadingState extends NewsState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class NewsLoadedState extends NewsState {
  List<ArticleModel> articleList;
  NewsLoadedState({required this.articleList});
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class NewsErrorState extends NewsState {
  String errorMessage;
  NewsErrorState({required this.errorMessage});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
