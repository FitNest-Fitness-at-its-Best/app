import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../data/helpers/api_response.dart';
import '../../../data/models/article.dart';
import '../../../data/repos/article.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  ArticleCubit() : super(ArticleInitial());

  final ArticleRepo _repo = ArticleRepo();

  Future<void> getArticles() async {
    emit(Articleloading());
    final response = await _repo.getArticles();
    switch (response.status) {
      case Status.LOADING:
        break;
      case Status.COMPLETED:
        emit(ArticleLoaded(articles: response.data));
        break;
      case Status.ERROR:
        emit(ArticleErr(msg: response.message));
        break;
    }
  }
}
