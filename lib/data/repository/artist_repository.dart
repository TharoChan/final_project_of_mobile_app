import 'package:final_project_of_mobile_app/DI/service_locator.dart';
import 'package:final_project_of_mobile_app/data/datasource/artist_datasource.dart';
import 'package:final_project_of_mobile_app/data/model/artist.dart';

abstract class ArtistRepository {
  Future<List<Artist>> artistList();
}

class ArtistLocalRepository extends ArtistRepository {
  final ArtistDatasource _datasource = locator.get();
  @override
  Future<List<Artist>> artistList() async {
    return await _datasource.getArtistList();
  }
}
