import 'dart:convert';
import 'package:news_app/shared/api_constants.dart';
import 'package:news_app/sources/data/data_sources/sources_data_source.dart';
import 'package:news_app/sources/data/models/source.dart';
import 'package:news_app/sources/data/models/sources_response.dart';
import 'package:http/http.dart' as http;

class SourcesAPIDataSource extends SourcesDataSource {
  @override
  Future<List<Source>> getSources(String categoryId) async {
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
    final sourcesResponse = SourcesResponse.fromJson(json);
     if (sourcesResponse.status == 'ok' && sourcesResponse.sources != null) {
        return sourcesResponse.sources!;
      } else {
        throw Exception('failed to get sources');
      }
  }
}
