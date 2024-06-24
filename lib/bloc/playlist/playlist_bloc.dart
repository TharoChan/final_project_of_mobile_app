import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project_of_mobile_app/bloc/playlist/playlist_event.dart';
import 'package:final_project_of_mobile_app/bloc/playlist/playlist_state.dart';
import 'package:final_project_of_mobile_app/data/repository/playlist_repository.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  final PLaylistRepository _repository;
  PlaylistBloc(this._repository) : super(PlaylistInitState()) {
    on<PlaylistFetchEvent>((event, emit) async {
      var playlist = await _repository.getList(event.mix);
      emit(PlaylistResponseState(playlist));
    });
  }
}
