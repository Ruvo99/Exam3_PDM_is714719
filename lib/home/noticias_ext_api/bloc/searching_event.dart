part of 'searching_bloc.dart';

abstract class SearchingEvent extends Equatable {
  const SearchingEvent();

  @override
  List<Object> get props => [];
}

class RequestToNewsApiEvent extends SearchingEvent {
  @override
  List<Object> get props => [];
}

class RequestWithQueryEvent extends SearchingEvent {
  final String query;

  RequestWithQueryEvent({@required this.query});

  @override
  List<Object> get props => [query];
}
