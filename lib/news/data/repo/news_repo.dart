import 'package:news_app/news/data/data_source/news_data_source.dart';
import 'package:news_app/news/data/models/article.dart';

class NewsRepo {
  NewsDataSource dataSource;
  NewsRepo({
    required this.dataSource,
  });
  Future<List<Article>> getNews(String sourceId) async {
    return dataSource.getNews(sourceId);
  }
}
