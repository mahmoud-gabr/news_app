import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/news/news_item.dart';
import 'package:news_app/widgets/error_indicator.dart';
import 'package:news_app/widgets/loading_indicator.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key, required this.sourceId});
  final String sourceId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getNews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        } else {
          final newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>  NewsItem(news: newsList[index]),
            itemCount: 5,
          );
        }
      },
    );
  }
}
