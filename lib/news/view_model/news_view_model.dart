import 'package:flutter/material.dart';
import 'package:news_app/news/data/data_source/news_data_source.dart';
import 'package:news_app/news/data/models/article.dart';

class NewsViewModel with ChangeNotifier {
  final dataSource = NewsDataSource();
  List<Article> articlesList = [];
  String? errorMessage;
  bool isLoading = false;
  Future getNews(String sourceId) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await dataSource.getNews(sourceId);
      if (response.status == 'ok' && response.articles != null) {
        articlesList = response.articles!;
      } else {
        errorMessage = 'failed to get news';
      }
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
