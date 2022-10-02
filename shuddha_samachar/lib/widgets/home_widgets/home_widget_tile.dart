

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/default_news_model.dart';
import '../../pages/artical_web_page.dart';
import '../../pages/categorised_page.dart';

class AreaCatagoryTile extends StatelessWidget {
  const AreaCatagoryTile({ Key? key, required this.areaimage, required this.areaname, required this.areaurl }) : super(key: key);
  final String areaimage;
  final String areaname,areaurl;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 229, 196, 168),
      child: InkWell(
        splashColor: Colors.amber,
        onTap: (() {
        Navigator.push(context, MaterialPageRoute(
          builder: (
            (context) => 
              CategorisedPage(caturl: areaurl)

          ) )
        );
      }),
        child: Column(
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(areaimage,width: 120,height: 70,
                // isAntiAlias: true,
                
                fit: BoxFit.fill
                
                ).p2(),
              ),
              
              ),
            Center(child: Text(areaname,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),))
          ],
        ),
      ),
    )
    .box
    .roundedLg.make();
  }
}








class CatagoryTile extends StatelessWidget {
  const CatagoryTile({ Key? key, required this.caturl,required this.catagoryName }) : super(key: key);
  final String caturl;
  final catagoryName;

  @override
  Widget build(BuildContext context) {
    return Card(
     
      color: const Color.fromARGB(255, 229, 196, 168),
      child: InkWell(
        splashColor: Colors.amber,
         onTap: (() {
        Navigator.push(context, MaterialPageRoute(
          builder: (
            (context) => 
              CategorisedPage(caturl: caturl)

          ) )
        );
      }),
        child: Column(
          children: [
            Text(catagoryName,style: const 
              TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
              .centered()
              .p8()
          ],
        ),
      ),
    );
  }
}








class NewsTile extends StatelessWidget {
  const NewsTile({ Key? key, required this.newsdetail,  }) : super(key: key);
  final Newsdetails newsdetail;
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: InkWell(
        splashColor: Colors.amber,
        onTap: (() {
        Navigator.push(context, MaterialPageRoute(
          builder: ((context) => 
          ArticalPage(articalUrl: newsdetail.url,image: newsdetail.imageurl,title: newsdetail.title,)
          ) )
        );
      }),
        child: Column(
          children: [
            
            Container(
              
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(newsdetail.imageurl,
                // isAntiAlias: true,
                // height: 200,
                fit: BoxFit.fitWidth
                
                ).p2(),
              ).p2(),
              
              ),
            Center(child: Text(newsdetail.title,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),))
          ],
        ),
      ),
    ).box.roundedLg.make().p2().py8();
  }
}

