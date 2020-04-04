const String GET_TEST_ANIME = r'''
query{
  Media (id: 15125, type: ANIME) {
    id
    title {
      romaji
      english
      native
    }
  }
}
''';