import 'package:flutter/material.dart';
import 'package:news_app/news/data/models/article.dart';
import 'package:news_app/news/data/repo/news_repo.dart';
import 'package:news_app/service_locator.dart';

class SearchedNewsViewModel with ChangeNotifier {
  final NewsRepo repo;
  SearchedNewsViewModel()
      : repo = NewsRepo(dataSource: ServiceLocator.searchedNewsDataSource);
  List<Article> articlesList = [];
  String? errorMessage;
  bool isLoading = false;
  Future getSearchedNews(String searchKey) async {
    isLoading = true;
    notifyListeners();
    try {
      articlesList = await repo.getNews(searchKey);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
