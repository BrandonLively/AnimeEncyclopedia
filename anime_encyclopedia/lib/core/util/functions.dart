import 'package:anime_encyclopedia/core/data/model/anime_model.dart';
import 'package:anime_encyclopedia/core/domain/entity/anime.dart';

List<Anime> animeListFromJson(List<dynamic> jsonList){
  List<Anime> animeList = [];
  for(Map<String, dynamic> jsonAnime in jsonList){
    animeList.add(AnimeModel.fromJson(jsonAnime));
  }
  return animeList;
}