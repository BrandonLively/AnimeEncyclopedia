import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Anime extends Equatable{
  final String titleRomaji;
  final String titleEnglish;
  final int ID;
  final Set<String> genres;
  final String coverImageUrl;
  final String bannerImageUrl;
  final int episodeCount;
  final String description;
  final int startYear;
  final int endYear;
  final bool isAdult;
  final int avgScore;

  Anime({
      @required this.titleRomaji,
      this.titleEnglish,
      @required this.ID,
      this.genres,
      this.coverImageUrl,
      this.bannerImageUrl,
      this.episodeCount,
      this.description,
      this.startYear,
      this.endYear,
      this.isAdult,
      this.avgScore});


  @override
  List<Object> get props => [
    titleRomaji,
    titleEnglish,
    ID,
    genres,
    coverImageUrl,
    bannerImageUrl,
    episodeCount,
    description,
    startYear,
    endYear,
    isAdult,
    avgScore,
  ];
}