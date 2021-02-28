part of 'article_cubit.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

class ArticleInitial extends ArticleState {}

class Articleloading extends ArticleState {}

class ArticleLoaded extends ArticleState {
  final List<Article> articles;

  ArticleLoaded({@required this.articles});
}

class ArticleErr extends ArticleState {
  final String msg;

  ArticleErr({@required this.msg});
}
