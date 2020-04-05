const String GET_TEST_ANIME = r'''
query
{
    Page (page: 1, perPage: 2) {
        pageInfo {
            total
            currentPage
            lastPage
            hasNextPage
            perPage
        }
        media{
          isAdult
          title{
            romaji
            english
          }
          coverImage{
            extraLarge
          }
          averageScore
          startDate {
            year
            month
            day
          }
          endDate {
            year
            month
            day
          }
          episodes
          description
          bannerImage
          
      genres
        }
    }
}

''';