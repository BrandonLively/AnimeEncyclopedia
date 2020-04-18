import 'package:flutter/material.dart';

import '../failure.dart';
import 'entity/anime.dart';
import 'package:dartz/dartz.dart';

abstract class AnimeRepository{
  Future <Either<Failure, List<Anime>>> getAllAnime();
  Future <Either<Failure, Anime>> getAnimeFromList({@required int id});
}