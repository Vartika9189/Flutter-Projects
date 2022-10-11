// import 'dart:js';

// import 'package:apk/pages/cart_page.dart';
// import 'package:shuddh_samachar/pages/home_page.dart';
// import 'package:shuddh_samachar/pages/login_page.dart';
// import 'package:apk/widget/themes.dart';
import 'package:flutter/material.dart';


import 'pages/home_page.dart';

// import 'package:shuddh_samachar/utils/routs.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
        home: HomePage(),
        // themeMode: ThemeMode.system,
        title: "SHUDDHA SAMACHAR",
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        // theme: MyTheme.themeData,     
    );
  }
}  