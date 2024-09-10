import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/news/view/widgets/news_item.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/shared/widgets/error_indicator.dart';
import 'package:news_app/shared/widgets/loading_indicator.dart';

class SearchNewsList extends StatelessWidget {
  const SearchNewsList({super.key, required this.searchKey});
  final String searchKey;
  @override
  Widget build(BuildContext context) {
    if (searchKey == '') {
      return Center(
        child: Text(
          'Enter search key',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: AppTheme.black,
              ),
        ),
      );
    }
    return FutureBuilder(
      future: ApiService.getSearchedNews(searchKey),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return const ErrorIndicator();
        } else {
          final newsList = snapshot.data?.articles ?? [];
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => NewsItem(news: newsList[index]),
            itemCount: newsList.length,
          );
        }
      },
    );
  }
}
