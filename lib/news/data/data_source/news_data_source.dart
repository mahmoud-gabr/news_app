import 'package:news_app/news/data/models/article.dart';

abstract class NewsDataSource {
  Future<List<Article>> getNews(String attr);
}
