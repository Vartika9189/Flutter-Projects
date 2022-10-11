import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuddha_samachar/widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:webview_flutter/webview_flutter.dart';


class ArticalPage extends StatefulWidget {
  const ArticalPage({ Key? key, required this.articalUrl, required this.image, required this.title }) : super(key: key);
  final String articalUrl,image,title;

  @override
  State<ArticalPage> createState() => _ArticalPageState();
}

class _ArticalPageState extends State<ArticalPage> {
  final Completer<WebViewController> completer = Completer<WebViewController>();
  @override
  void initState() {
     super.initState();
     _loading = false;
     // Enable virtual display.
     WebView.platform = AndroidWebView();
     
   }

  bool _loading = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          elevation: 0,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            const Icon(CupertinoIcons.news,color: Colors.blue,size: 40,).px12(),
            "शुद्ध ".text.amber500.xl2.bold.make(),
            "Samachar".text.blue900.xl4.extraBold.make()
            ],),

        ),
      body: _loading?LinearProgressIndicator():Container(
        child: WebView(
          initialUrl: widget.articalUrl,
          // onWebViewCreated: completer.complete(),
        ),
      ),
      drawer: MyDrawer(),
    )
      
    ;
  }
}