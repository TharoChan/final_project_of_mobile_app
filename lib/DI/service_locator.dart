import 'package:get_it/get_it.dart';
import 'package:final_project_of_mobile_app/data/datasource/album_datasource.dart';
import 'package:final_project_of_mobile_app/data/datasource/artist_datasource.dart';
import 'package:final_project_of_mobile_app/data/datasource/playlist_datasource.dart';
import 'package:final_project_of_mobile_app/data/datasource/podcast_datasource.dart';
import 'package:final_project_of_mobile_app/data/repository/album_repository.dart';
import 'package:final_project_of_mobile_app/data/repository/artist_repository.dart';
import 'package:final_project_of_mobile_app/data/repository/playlist_repository.dart';
import 'package:final_project_of_mobile_app/data/repository/podcast_repository.dart';

var locator = GetIt.instance;

void initServiceLocator() {
  locator.registerSingleton<ArtistDatasource>(ArtistLocalDatasource());
  locator.registerSingleton<PodcastDatasource>(PodcastLocalDatasource());
  locator.registerSingleton<AlbumDatasource>(AlbumLocalDatasource());
  locator.registerSingleton<PlaylistDatasource>(PLaylistLocalDatasource());

  locator.registerSingleton<ArtistRepository>(ArtistLocalRepository());
  locator.registerSingleton<PodcastRepository>(PodcastLocalRepository());
  locator.registerSingleton<AlbumRepository>(AlbumLocalRepository());
  locator.registerSingleton<PLaylistRepository>(PlaylistLocalRepository());
}
