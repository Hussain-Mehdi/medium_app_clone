import 'dart:convert';
import 'news.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=890b76818bc34378bb8c92a1420a9fcc

  final String authority = 'newsapi.org';
  final String path = 'v2/everything';
  final String apiKey = '890b76818bc34378bb8c92a1420a9fcc';

  Future<List<News>> getNews(String location) async {
    try {
      Map<String, dynamic> parameter = {'q': location, 'apiKey': apiKey};

      Uri uri = Uri.https(authority, path, parameter);

      final http.Response result = await http.get(uri);

      var articles = jsonDecode(result.body)['articles'] as List;

      // print(articles);
      //final Map<String, dynamic> data = json.decode(result.body);
      // final Map<String, dynamic> data = Map.castFrom(jsonDecode(result.body));

      List<News> news =
          articles.map((article) => News.fromJson(article)).toList();
      print("news========>$news");
      return news;
    } catch (e) {
      print("Exception========>${e}");
      return [];
    }
  }

  Future<List<News>> getNewsInLanguage(String location, String language) async {
    Map<String, dynamic> parameter = {'q': location, 'apiKey': apiKey};

    Uri uri = Uri.https(authority, path, parameter);

    final http.Response result = await http.get(uri);

    var articles = jsonDecode(result.body)['articles'] as List;

    //final Map<String, dynamic> data = json.decode(result.body);
    // final Map<String, dynamic> data = Map.castFrom(jsonDecode(result.body));

    List<News> news =
        articles.map((article) => News.fromJson(article)).toList();
    return news;
  }
}
