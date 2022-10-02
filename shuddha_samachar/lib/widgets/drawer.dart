// ignore_for_file: prefer_const_constructors

// import 'dart:html';

// import 'package:apk/pages/home_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:apk/utils/routs.dart';

// import 'package:cupertino_icons';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {


  

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurpleAccent,
        child: ListView(
          padding: EdgeInsets.zero,
          children:  const [
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                // onDetailsPressed: () {
                  
                // },
                margin: EdgeInsets.all(0),
                decoration: BoxDecoration(color: Colors.deepPurple),
                accountName: Text("user@name"),
                accountEmail: Text(
                  "user@email",
                ),

                currentAccountPicture: CircleAvatar(
                  backgroundImage:
                      AssetImage("lib/utils/images/India.jpg"),
                  
                  
                ),


              ),
              padding: EdgeInsets.zero,
              margin: EdgeInsets.all(0),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: Text("Home", style: TextStyle(color: Colors.white)),
              
            ),   
            ListTile(
              leading: Icon(
                CupertinoIcons.briefcase_fill,
                color: Colors.white,
              ),
              title: Text("Contact Me", style: TextStyle(color: Colors.white)),
              subtitle: Text("Shubham Jaiswal\nshubham.jaiswal.ece21@itbhu.ac.in", style: TextStyle(color: Colors.white)), 
            )
          ],
        ),
      ),
    );
  }
}