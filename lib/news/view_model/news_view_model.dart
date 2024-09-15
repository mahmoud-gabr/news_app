import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/data/repo/news_repo.dart';
import 'package:news_app/news/view_model/news_state.dart';
import 'package:news_app/service_locator.dart';

class NewsViewModel extends Cubit<NewsStat> {
  late final NewsRepo repo;
  NewsViewModel() : super(NewsInitial()) {
    repo = NewsRepo(dataSource: ServiceLocator.newsDataSource);
  }
  Future<void> getNews(String sourceId) async {
    emit(GetNewsLoading());
    try {
      final articlesList = await repo.getNews(sourceId);
      emit(GetNewsSuccsess(articles: articlesList));
    } catch (error) {
      emit(GetNewsError(errorMessage: error.toString()));
    }
  }
}

