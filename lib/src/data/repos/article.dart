import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../helpers/api_response.dart';
import '../models/article.dart';

class ArticleRepo {
  final _articlesUrl = "https://medium.com/feed/topic/food";
  final _url = "https://medium-rss-api.herokuapp.com";

  Future<ApiResponse<List<Article>>> getArticles() async {
    try {
      final response = await http.post(
        _url,
        body: jsonEncode(
          {"uri": _articlesUrl},
        ),
      );
      switch (response.statusCode) {
        case 200:
          return ApiResponse.completed(
            articleFromJson(
              utf8.decode(response.bodyBytes),
            ),
          );
          break;
        default:
          return ApiResponse.error("Something went wrong");
      }
    } on SocketException {
      return ApiResponse.error("No internet connection");
    } catch (e) {
      return ApiResponse.error("Something went wrong");
    }
  }
}
