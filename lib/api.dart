import 'package:news_app/Models/Articles.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class api {
  final String apiKey="3df323e2e84c4cf7a6c5c029a9020335";
  Future <List<Articles>>getNews() async{
    var url= Uri.parse("https://newsapi.org/v2/everything?q=Apple&from=2021-09-07&sortBy=popularity&apiKey=$apiKey");
    var response= await http.get(url);
    List <Articles> articleList=[];
    if(response.statusCode==200){
      var responsebody=jsonDecode(response.body)["articles"];
      for (var i in responsebody)
        {
          Articles temp= Articles(title: i["title"],description: i["description"],url: i["url"],urlToImage: i["urlToImage"]);
          articleList.add(temp);
        }
      return articleList;
    }
    return articleList;

  }
  Future <List<Articles>>getNewsByCategory(String category) async{
    var url= Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=${category}&apiKey=$apiKey");
    var response= await http.get(url);
    List <Articles> articleList=[];
    if(response.statusCode==200){
      var responsebody=jsonDecode(response.body)["articles"];
      for (var i in responsebody)
      {
        Articles temp= Articles(title: i["title"],description: i["description"],url: i["url"],urlToImage: i["urlToImage"]);
        articleList.add(temp);
      }
      return articleList;
    }
    return articleList;

  }


}