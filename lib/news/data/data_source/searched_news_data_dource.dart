import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/news/data/models/news_response.dart';
import 'package:news_app/shared/api_constants.dart';

class SearchedNewsDataSource {
  Future<NewsResponse> getSearchedNews(String searchFor) async{
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
    return NewsResponse.fromJson(json);
  }
}