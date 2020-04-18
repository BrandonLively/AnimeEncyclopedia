import 'package:anime_encyclopedia/core/domain/entity/anime.dart';
import 'package:anime_encyclopedia/core/util/api_constants.dart';
import 'package:meta/meta.dart';

class AnimeModel extends Anime {
  AnimeModel({
    @required String titleRomaji,
    String titleEnglish,
    @required int ID,
    Set<String> genres,
    String coverImageUrl,
    String bannerImageUrl,
    int episodeCount,
    String description,
    int startYear,
    int endYear,
    bool isAdult,
    int avgScore
}): super(
    ID: ID,
    titleEnglish: titleEnglish,
    titleRomaji: titleRomaji,
    genres: genres,
    coverImageUrl: coverImageUrl,
    bannerImageUrl: bannerImageUrl,
    episodeCount: episodeCount,
    description: description,
    startYear: startYear,
    endYear: endYear,
    isAdult: isAdult,
    avgScore: avgScore,
  );


  factory AnimeModel.fromJson(Map<String, dynamic> json){
    return AnimeModel(
        ID: json[ANIME_ID],
        titleRomaji: json[ANIME_TITLE][ANIME_TITLE_ROMAJI],
        titleEnglish: json[ANIME_TITLE][ANIME_TITLE_ENGLISH],
        genres: Set.from(json[ANIME_GENRES]),
        coverImageUrl: json[ANIME_COVER_IMAGE_BASE][ANIME_COVER_IMAGE_SIZE],
        bannerImageUrl: json[ANIME_BANNER_IMAGE],
        episodeCount: json[ANIME_EPISODE_COUNT],
        description: json[ANIME_DESCRIPTION],
        startYear: json[ANIME_START_DATE_BASE][ANIME_START_DATE_YEAR],
        endYear: json[ANIME_END_DATE_BASE][ANIME_END_DATE_YEAR],
        isAdult: json[ANIME_IS_ADULT],
        avgScore: json[ANIME_AVG_RATING],
    );
  }
}