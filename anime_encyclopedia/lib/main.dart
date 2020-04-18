import 'package:anime_encyclopedia/core/data/remote_data_source.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'core/domain/entity/anime.dart';

void main() => runApp(MyApp());

GraphQLAnimeRemoteDataSource remoteDataSource = GraphQLAnimeRemoteDataSource(
  GraphQLClient(
    cache: InMemoryCache(),
    link: HttpLink(uri: 'https://graphql.anilist.co'),
  ),
);

List<Anime> animeList;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime Encyclopedia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Anime Encyclopedia'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: createAnimeList(getResults(), context),
      ),
    );
  }

  Future<List<Anime>> getResults() {
    return remoteDataSource.getTestAnime();
  }
}

Widget createAnimeList(Future<List<Anime>> animeList, BuildContext context) {
  return FutureBuilder(
    future: animeList,
    builder: (BuildContext context, AsyncSnapshot<List<Anime>> snapshot) {
      if (snapshot.hasError || !snapshot.hasData) {
        return Center(child: CircularProgressIndicator());
      } else {
        return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return createAnimeTile(snapshot.data[index]);
            });
      }
    },
  );
}

Widget createAnimeTile(Anime anime) {
  String genreRawStr = anime.genres.toString();
  int genreLen = genreRawStr.length;
  String genres = genreLen > 30
      ? '${genreRawStr.substring(1, 30)}...'
      : genreRawStr.substring(1, genreLen - 1);
  String title =
      anime.titleEnglish == null ? anime.titleRomaji : anime.titleEnglish;
  title = title.length > 30 ? '${title.substring(0, 30)}...' : title;
  String years = '${anime.startYear} - ${anime.endYear}';
  Widget image = Image.network(anime.coverImageUrl);

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        decoration: BoxDecoration(
            border: Border.all(), borderRadius: BorderRadius.circular(10)),
        height: 100,
        child: Stack(
          children: <Widget>[
            Positioned(
                left: 0,
                bottom: 0,
                top: 0,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8)),
                    child: image)),
            Positioned(
              top: 8,
              right: 8,
              child: Text(title),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: Text(
                genres,
              ),
            ),
            Positioned(
              bottom: 8,
              left: 80,
              child: Text(
                years,
              ),
            ),
            Positioned(
              right: 8,
              top: 40,
              child: Text(
                'Rating - ${anime.avgScore.toString()}',
              ),
            ),
          ],
        )),
  );
}
