import 'package:flutter/material.dart';
import 'package:news_app/news/view/widgets/news_item.dart';
import 'package:news_app/news/view_model/searched_news_view_model.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:news_app/shared/widgets/error_indicator.dart';
import 'package:news_app/shared/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class SearchNewsList extends StatefulWidget {
  const SearchNewsList({super.key, required this.searchKey});
  final String searchKey;

  @override
  State<SearchNewsList> createState() => _SearchNewsListState();
}

class _SearchNewsListState extends State<SearchNewsList> {
  final viewModel = SearchedNewsViewModel();
  @override
  Widget build(BuildContext context) {
    if (widget.searchKey.isNotEmpty) {
      viewModel.getSearchedNews(widget.searchKey);
    }
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: widget.searchKey.isEmpty
          ? Center(
              child: Text(
                'Enter search key',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppTheme.black,
                    ),
              ),
            )
          : Consumer<SearchedNewsViewModel>(
              builder: (_, viewModel, __) {
                if (viewModel.isLoading) {
                  return const LoadingIndicator();
                } else if (viewModel.errorMessage != null) {
                  return const ErrorIndicator();
                } else {
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        NewsItem(news: viewModel.articlesList[index]),
                    itemCount: viewModel.articlesList.length,
                  );
                }
              },
            ),
    );
  }
}
