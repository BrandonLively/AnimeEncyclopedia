import 'dart:convert';

import 'package:anime_encyclopedia/core/data/query.dart';
import 'package:anime_encyclopedia/core/domain/entity/anime.dart';
import 'package:anime_encyclopedia/core/util/functions.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLAnimeRemoteDataSource{
  final GraphQLClient client;

  GraphQLAnimeRemoteDataSource(this.client);

  Future<List<Anime>> getTestAnime() async {
    final QueryOptions queryOptions = QueryOptions(
      documentNode: gql(GET_TEST_ANIME),
    );

    final QueryResult result = await client.query(queryOptions);
    List<dynamic> animeJsonList = result.data["Page"]["media"];
    return animeListFromJson(animeJsonList);
  }
}