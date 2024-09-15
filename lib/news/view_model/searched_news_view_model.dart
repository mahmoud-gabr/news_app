import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/data/repo/news_repo.dart';
import 'package:news_app/news/view_model/news_state.dart';
import 'package:news_app/service_locator.dart';

class SearchedNewsViewModel extends Cubit<NewsStat> {
  late final NewsRepo repo;
  SearchedNewsViewModel() : super(NewsInitial()) {
    repo = NewsRepo(dataSource: ServiceLocator.searchedNewsDataSource);
  }
  Future<void> getSearchedNews(String searchKey) async {
    emit(GetNewsLoading());
    try {
      final articlesList = await repo.getNews(searchKey);
      emit(GetNewsSuccsess(articles: articlesList));
    } catch (error) {
      emit(GetNewsError(errorMessage: error.toString()));
    }
  }
}
