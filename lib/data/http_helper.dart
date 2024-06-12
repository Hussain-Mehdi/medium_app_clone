import 'dart:convert';
import 'news.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String authority = 'newsapi.org';
  final String path = 'v2/everything';
  final String apiKey = 'paste your api key here and run the app';

  Future<List<News>> getNews(String location) async {
    try {
      Map<String, dynamic> parameter = {'q': location, 'apiKey': apiKey};

      Uri uri = Uri.https(authority, path, parameter);

      final http.Response result = await http.get(uri);

      var articles = jsonDecode(result.body)['articles'] as List;
      List<News> news =
          articles.map((article) => News.fromJson(article)).toList();
      return news;
    } catch (e) {
      return [];
    }
  }

  Future<List<News>> getNewsInLanguage(String location, String language) async {
    Map<String, dynamic> parameter = {'q': location, 'apiKey': apiKey};

    Uri uri = Uri.https(authority, path, parameter);

    final http.Response result = await http.get(uri);

    var articles = jsonDecode(result.body)['articles'] as List;

    List<News> news =
        articles.map((article) => News.fromJson(article)).toList();
    return news;
  }
}
