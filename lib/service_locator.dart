import 'package:news_app/news/data/data_source/news_api_data_source.dart';
import 'package:news_app/news/data/data_source/news_data_source.dart';
import 'package:news_app/news/data/data_source/searched_news_api_data_dource.dart';
import 'package:news_app/sources/data/data_sources/sources_api_data_source.dart';
import 'package:news_app/sources/data/data_sources/sources_data_source.dart';

class ServiceLocator {
  static SourcesDataSource sourcesDataSource = SourcesAPIDataSource();
  static NewsDataSource newsDataSource = NewsAPIDataSource();
  static NewsDataSource searchedNewsDataSource = SearchedNewsAPIDataSource();
}
