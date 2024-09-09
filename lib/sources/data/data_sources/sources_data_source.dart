import 'dart:convert';
import 'package:news_app/shared/api_constants.dart';
import 'package:news_app/sources/data/models/sources_response.dart';
import 'package:http/http.dart' as http;

class SourcesDataSource {
   Future<SourcesResponse> getSources(String categoryId) async {
    final uri = Uri.https(
      APIConstants.baseURL,
      APIConstants.sourcesEndPoints,
      {
        'apiKey': APIConstants.apiKey,
        'category': categoryId,
      },
    );
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return SourcesResponse.fromJson(json);
  }

}