import 'package:bloc_pattern_sample/second_page.dart';
import 'package:flutter/material.dart';

import 'first_page.dart';

//Define the MainDrawer. It will be used every time in a new page
class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent),
            accountName: Text("Test"),
            accountEmail: Text("test@test.com"),
            //currentAccountPicture:
            //  CircleAvatar(
            //   backgroundColor: Colors.transparent,
            //   backgroundImage: AssetImage('assets/logo_white.png'),
            // ),
          ),
          ListTile(
            title: Text('Page1'),
            leading: Icon(Icons.landscape, color: Colors.black),
            onTap: () {
              //Close the drawer
              Navigator.of(context).pop();
              //Navigate to home page
              //Navigate with avoiding the possibility to return
              Navigator.of(context).pushReplacementNamed(FirstPage.tag);
              //Navigator.of(context).push(MaterialPageRoute(
              //  builder: (BuildContext context) => HomePage()));
            },
          ),
          ListTile(
            title: Text('Page2'),
            leading: Icon(Icons.line_style, color: Colors.black),
            onTap: () {
              //Close the drawer
              Navigator.of(context).pop();
              //Navigate to home page
              //Navigate with avoiding the possibility to return
              Navigator.of(context).pushReplacementNamed(SecondPage.tag);
              //Navigator.of(context).push(MaterialPageRoute(
              //  builder: (BuildContext context) => HomePage()));
            },
          ),
        ],
      ),
    );
  }
}
