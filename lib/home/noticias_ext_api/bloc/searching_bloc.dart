import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:google_login/models/new.dart';
import 'package:google_login/utils/news_repository.dart';

part 'searching_event.dart';
part 'searching_state.dart';

class SearchingBloc extends Bloc<SearchingEvent, SearchingState> {
  final newsRepo = NewsRepository();
  SearchingBloc() : super(SearchingInitial());

  @override
  Stream<SearchingState> mapEventToState(
    SearchingEvent event,
  ) async* {
    if (event is RequestToNewsApiEvent) {
      yield LoadNewsApiState();
      yield LoadedNewsApiState(
          apiNewsList: await newsRepo.getAvailableNoticias('sports'));
    }
    else if (event is RequestWithQueryEvent){
      yield LoadedNewsApiState(apiNewsList: await newsRepo.getAvailableNoticias(event.query));
    }
  }
}
