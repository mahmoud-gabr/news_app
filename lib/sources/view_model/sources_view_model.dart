import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/sources/data/repo/sources_repo.dart';
import 'package:news_app/service_locator.dart';
import 'package:news_app/sources/view_model/sources_state.dart';

class SourcesViewModel extends Cubit<SourcesState> {
  late final SourcesRepo repo;
  SourcesViewModel() : super(SourcesInitial()) {
    repo = SourcesRepo(dataSource: ServiceLocator.sourcesDataSource);
  }
  Future<void> getSources(String categoryId) async {
    emit(GetSourcesLoading());
    try {
      final sources = await repo.getSources(categoryId);
      emit(GetSourcesSuccess(sources: sources));
    } catch (error) {
      emit(GetSourcesError(errorMessage: error.toString()));
    }
  }
}
