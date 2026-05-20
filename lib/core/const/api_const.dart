class ApiConst {
  static const String baseUrl = "https://api.themoviedb.org/3/movie";
  static const String apiKey = "87903828b97a85b50c60fb3bbd960c55";

  //end points
  static const String nowPlaying = "$baseUrl/now_playing?api_key=$apiKey";
  static const String topRated = "$baseUrl/top_rated?api_key=$apiKey";
  static const String popular = "$baseUrl/popular?api_key=$apiKey";
}
