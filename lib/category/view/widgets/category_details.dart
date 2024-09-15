import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/sources/view/widgets/sources_tab.dart';
import 'package:news_app/sources/view_model/sources_state.dart';
import 'package:news_app/sources/view_model/sources_view_model.dart';
import 'package:news_app/shared/widgets/error_indicator.dart';
import 'package:news_app/shared/widgets/loading_indicator.dart';

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
    return BlocProvider(
      create: (_) => viewModel,
      child: BlocBuilder<SourcesViewModel, SourcesState>(
        builder: (_, state) {
          if (state is GetSourcesLoading) {
            return const LoadingIndicator();
          } else if (state is GetSourcesError) {
            return ErrorIndicator(
              errorMessage: state.errorMessage,
            );
          } else if (state is GetSourcesSuccess) {
            return SourcesTab(sources: state.sources);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
