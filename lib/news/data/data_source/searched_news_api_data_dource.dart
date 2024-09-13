import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/news/data/data_source/news_data_source.dart';
import 'package:news_app/news/data/models/article.dart';
import 'package:news_app/news/data/models/news_response.dart';
import 'package:news_app/shared/api_constants.dart';

class SearchedNewsAPIDataSource extends NewsDataSource {
  @override
  // ignore: avoid_renaming_method_parameters
  Future<List<Article>> getNews(String searchFor) async {
    final uri = Uri.https(
      APIConstants.baseURL,
      APIConstants.newsEndPoints,
      {
        'apiKey': APIConstants.apiKey,
        'q': searchFor,
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    final newsResponse = NewsResponse.fromJson(json);
    if (newsResponse.status == 'ok' && newsResponse.articles != null) {
      return newsResponse.articles!;
    } else {
      throw Exception('failed to get news');
    }
  }
}
