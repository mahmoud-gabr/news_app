import 'package:flutter/material.dart';
import 'package:news_app/news/view/widgets/news_item.dart';
import 'package:news_app/news/view_model/news_view_model.dart';
import 'package:news_app/shared/widgets/error_indicator.dart';
import 'package:news_app/shared/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key, required this.sourceId});
  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final viewModel = NewsViewModel();
  @override
  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourceId);
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<NewsViewModel>(
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
