import 'package:flutter/material.dart';
import 'package:news_app/sources/view/widgets/sources_tab.dart';
import 'package:news_app/sources/view_model/sources_view_model.dart';
import 'package:news_app/shared/widgets/error_indicator.dart';
import 'package:news_app/shared/widgets/loading_indicator.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails(this.categoryId, {super.key});
  final String categoryId;

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  final viewModel = SourcesViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer<SourcesViewModel>(
        builder: (_, viewModel, __) {
          if (viewModel.isLoading) {
            return const LoadingIndicator();
          } else if (viewModel.errorMessage != null) {
            return ErrorIndicator(
              errorMessage: viewModel.errorMessage!,
            );
          } else {
            return SourcesTab(sources: viewModel.sources);
          }
        },
      ),
    );
  }
}
