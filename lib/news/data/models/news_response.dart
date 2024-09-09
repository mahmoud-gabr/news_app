import 'article.dart';

class NewsResponse {
  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  const NewsResponse({this.status, this.totalResults, this.articles});

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
        status: json['status'] as String?,
        totalResults: json['totalResults'] as int?,
        articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
