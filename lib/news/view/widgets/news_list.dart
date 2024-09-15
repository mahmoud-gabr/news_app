import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/view/widgets/news_item.dart';
import 'package:news_app/news/view_model/news_state.dart';
import 'package:news_app/news/view_model/news_view_model.dart';
import 'package:news_app/shared/widgets/error_indicator.dart';
import 'package:news_app/shared/widgets/loading_indicator.dart';


class NewsList extends StatefulWidget {
  const NewsList({super.key, required this.sourceId});
  final String sourceId;

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  final viewModel = NewsViewModel();
  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.sourceId);
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<NewsViewModel, NewsStat>(
        builder: (_, state) {
          if (state is GetNewsLoading) {
            return const LoadingIndicator();
          } else if (state is GetNewsError) {
            return const ErrorIndicator();
          } else if (state is GetNewsSuccsess) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  NewsItem(news: state.articles[index]),
              itemCount: state.articles.length,
            );
          }
          else{
            return const SizedBox();
          }
        },
      ),
    );
  }
}
