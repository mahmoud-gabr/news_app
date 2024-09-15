import 'package:news_app/sources/data/models/source.dart';

abstract class SourcesState {}

class SourcesInitial extends SourcesState {}

class GetSourcesLoading extends SourcesState {}

class GetSourcesSuccess extends SourcesState {
  final List<Source> sources;

  GetSourcesSuccess({required this.sources});
}

class GetSourcesError extends SourcesState {
  final String errorMessage;

  GetSourcesError({required this.errorMessage});
}
