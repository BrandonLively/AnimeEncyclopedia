import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

part 'anime_list_event.dart';

part 'anime_list_state.dart';

class AnimeListBloc extends Bloc<AnimeListEvent, AnimeListState> {

  @override
  AnimeListState get initialState => InitialAnimeListState();

  @override
  Stream<AnimeListState> mapEventToState(AnimeListEvent event) async* {
    // TODO: Add your event logic
  }
}
