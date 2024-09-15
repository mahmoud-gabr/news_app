import 'package:news_app/news/data/models/article.dart';

class NewsStat {}

class NewsInitial extends NewsStat {}

class GetNewsLoading extends NewsStat {}

class GetNewsSuccsess extends NewsStat {
  final List<Article> articles;

  GetNewsSuccsess({required this.articles});
}

class GetNewsError extends NewsStat {
  final String errorMessage;

  GetNewsError({required this.errorMessage});
}
