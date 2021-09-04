import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/articleModel.dart';

class NewsRepository {
  Future<List<ArticleModel>> fetchnews() async {
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=bfe4d61aa6be4f0e8168038307168906"));
    var data = json.decode(response.body);
    List<ArticleModel> _articleModelList = [];
    print(response.statusCode);
    if (response.statusCode == 200) {
      //print("h");
      for (var item in data['articles']) {
        // print("hello 1");
        ArticleModel _articleModel = ArticleModel.fromJson(item);
        // print("hello 2");

        //print("abc- ${_articleModel.author}");
        _articleModelList.add(_articleModel);
      }
      print(_articleModelList.length);
      return _articleModelList;
    } else {
      print("error");
      return _articleModelList;
    }
  }
}
