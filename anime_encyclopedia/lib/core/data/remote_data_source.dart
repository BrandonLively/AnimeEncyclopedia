import 'package:anime_encyclopedia/core/data/query.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLAnimeRemoteDataSource{
  final GraphQLClient client;

  GraphQLAnimeRemoteDataSource(this.client);

  Future<String> getTestAnime() async {
    final QueryOptions queryOptions = QueryOptions(
      documentNode: gql(GET_TEST_ANIME),
    );

    final QueryResult result = await client.query(queryOptions);
    return result.data.toString();
  }
}