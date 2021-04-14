part of 'searching_bloc.dart';

abstract class SearchingState extends Equatable {
  const SearchingState();

  @override
  List<Object> get props => [];
}

class SearchingInitial extends SearchingState {}

class LoadNewsApiState extends SearchingState {}

class LoadedNewsApiState extends SearchingState {
  final List<New> apiNewsList;

  LoadedNewsApiState({@required this.apiNewsList});
  @override
  List<Object> get props => [apiNewsList];
}

class ErrorNewsApiState extends SearchingState {
  final String error;

  ErrorNewsApiState({@required this.error});

  @override
  List<Object> get props => [error];
}
