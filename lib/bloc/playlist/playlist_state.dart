import 'package:final_project_of_mobile_app/data/model/playlist.dart';

abstract class PlaylistState {}

class PlaylistInitState extends PlaylistState {}

class PlaylistResponseState extends PlaylistState {
  Playlist playlist;

  PlaylistResponseState(this.playlist);
}
