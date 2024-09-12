import 'package:flutter/material.dart';
import 'package:news_app/news/data/data_source/searched_news_data_dource.dart';
import 'package:news_app/news/data/models/article.dart';

class SearchedNewsViewModel with ChangeNotifier {
  final dataSource = SearchedNewsDataSource();
  List<Article> articlesList = [];
  String? errorMessage;
  bool isLoading = false;
  Future getSearchedNews(String searchKey) async {
    isLoading = true;
    notifyListeners();
    try {
      final response = await dataSource.getSearchedNews(searchKey);
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
