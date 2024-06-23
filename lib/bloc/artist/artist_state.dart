import 'package:final_project_of_mobile_app/data/model/artist.dart';

abstract class ArtistState {}

class ArtistInitState extends ArtistState {}

class ArtistListState extends ArtistState {
  List<Artist> artistList;

  ArtistListState(this.artistList);
}
