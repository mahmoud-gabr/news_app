import 'package:flutter/material.dart';

import 'package:news_app/news/data/models/article.dart';
import 'package:news_app/news/data/repo/news_repo.dart';
import 'package:news_app/service_locator.dart';

class NewsViewModel with ChangeNotifier {
  final NewsRepo repo;
  NewsViewModel() : repo = NewsRepo(dataSource: ServiceLocator.newsDataSource);
  List<Article> articlesList = [];
  String? errorMessage;
  bool isLoading = false;
  Future getNews(String sourceId) async {
    isLoading = true;
    notifyListeners();
    try {
      articlesList = await repo.getNews(sourceId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
