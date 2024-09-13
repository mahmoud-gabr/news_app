import 'package:flutter/material.dart';
import 'package:news_app/sources/data/models/source.dart';
import 'package:news_app/sources/data/repo/sources_repo.dart';
import 'package:news_app/service_locator.dart';

class SourcesViewModel with ChangeNotifier {
  final SourcesRepo repo;
  SourcesViewModel() : repo = SourcesRepo(dataSource: ServiceLocator.sourcesDataSource);
  List<Source> sources = [];
  String? errorMessage;
  bool isLoading = false;
  Future getSources(String categoryId) async {
    isLoading = true;
    notifyListeners();
    try {
     sources = await repo.getSources(categoryId);
    } catch (error) {
      errorMessage = error.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
