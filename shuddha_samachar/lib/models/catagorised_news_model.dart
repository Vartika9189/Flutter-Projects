import 'dart:convert';
import 'package:http/http.dart' as http;

import 'default_news_model.dart';










class CatagorisedNews{
  List<Newsdetails> news = [];

   


  Future<void> getCatagorisedNews(String url)async {
    
    
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if(jsonData["status"]=="ok") {
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element["content"]!= null){
          
          Newsdetails newsdetails = Newsdetails(
            title: element["title"],
            url:element["url"],
            imageurl: element["urlToImage"], 
            content: element["content"]
            );
          news.add(newsdetails);
        }
      });
    }


  } 


}