import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catagorised_news_model.dart';
import '../models/default_news_model.dart';
import '../widgets/drawer.dart';
import '../widgets/home_widgets/home_widget_tile.dart';
import 'home_page.dart';

class CategorisedPage extends StatefulWidget {
  const CategorisedPage({ Key? key, required this.caturl,  }) : super(key: key);
  final String caturl;
  

  @override
  State<CategorisedPage> createState() => _CategorisedPageState();
}

class _CategorisedPageState extends State<CategorisedPage> {
  List<Newsdetails> newslist = <Newsdetails>[];
  bool _loading = true;
   @override
  void initState() {
    super.initState();
    
    
    
    getNewsDetails();
  }

  getNewsDetails() async {
    CatagorisedNews newsClass = CatagorisedNews();
    await newsClass.getCatagorisedNews(widget.caturl);
    newslist = newsClass.news;
    setState(() {
      _loading = false;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        drawer: MyDrawer(),
          body: 
        SafeArea(
          child: 
          _loading
          ?Container(
            child: const LinearProgressIndicator(),)
          :SingleChildScrollView(
            child: Container(
                  color: const Color.fromARGB(255, 245, 239, 226),
                  child: 
                  Column(
                    children: 
                    [
                      
                      
                      Row(
                        children: [
                                    "Top HeadLines".text.caption(context).xl3.make().px12().pOnly(top: 10)
                        ],
                      ),

                      Container(
                      
                      
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
          
                        shrinkWrap: true,
                        itemCount: newslist.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return NewsTile(
                          
                            newsdetail: newslist[index],
          
          
          
                          );
                        },
                      ),
          
          
                      )
                    ]
                  )
              ),
          ),

    ),  

      
    );
  }
}