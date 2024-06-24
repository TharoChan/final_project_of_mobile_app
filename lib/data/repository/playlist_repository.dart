import 'package:final_project_of_mobile_app/DI/service_locator.dart';
import 'package:final_project_of_mobile_app/data/datasource/playlist_datasource.dart';
import 'package:final_project_of_mobile_app/data/model/playlist.dart';

abstract class PLaylistRepository {
  Future<Playlist> getList(String mix);
}

class PlaylistLocalRepository extends PLaylistRepository {
  final PlaylistDatasource _datasource = locator.get();
  @override
  Future<Playlist> getList(String mix) async {
    return await _datasource.trackList(mix);
  }
}
