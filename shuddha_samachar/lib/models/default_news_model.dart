
import 'dart:convert';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter_application_1/utils/catagory.dart';
import 'package:http/http.dart' as http;


class Newsdetails{
  late String imageurl,title,content,authorname,url;

  Newsdetails({required this.title,required this.content,required this.imageurl,required this.url});
}




class News{
  List<Newsdetails> news = [];

   


  Future<void> getNews()async {
    String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=2e48ac443b974b14ac8787dee5492e36";
    
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