import 'package:anime_encyclopedia/core/data/remote_data_source.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() => runApp(MyApp());

GraphQLAnimeRemoteDataSource remoteDataSource = GraphQLAnimeRemoteDataSource(
    GraphQLClient(
        cache: InMemoryCache(),
        link: HttpLink(uri: 'https://graphql.anilist.co')));

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
      body: FutureBuilder<String>(
        future: getResults(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            Widget child = Text(snapshot.data);
            return child;
          } else
            return Text("No Data");
        },
      ),
    );
  }

  Future<String> getResults() {
    return remoteDataSource.getTestAnime();
  }
}
