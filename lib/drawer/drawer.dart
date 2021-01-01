import 'package:cirs/drawer/drawer-items.dart';
import 'package:flutter/material.dart';

/*
BuildContext cont;

ListView lv = new ListView(
  padding: EdgeInsets.zero,
  //TODO: Change Icons
  children: <Widget>[
    DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: Text(
        'CIRS App',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
        ),
      ),
    ),
    ListTile(
      leading: Icon(Icons.message),
      title: Text('Fälle bearbeiten'),
    ),
    ListTile(
      leading: Icon(Icons.account_circle),
      title: Text('Bericht erstellen'),
      onTap: () {
        Navigator.push(
          cont,
          MaterialPageRoute(builder: (context) => Report_Questionnaire()),
        );
      },
    ),
    ListTile(
      leading: Icon(Icons.settings),
      title: Text('Vorfälle ansehen'),
    ),
    ListTile(
      leading: Icon(Icons.info_rounded),
      title: Text('Über'),
    ),
  ],
);
*/

class MyDrawer extends StatelessWidget {
  // Stream _tokenStream$ = TokenStorage().stream$;

  @override
  Widget build(BuildContext context) {
    //cont = context;
    //return Drawer(child: lv);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        //TODO: Change Icons
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'CIRS App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          DrawerItems(),
        ],
      ),
    );
  }
}
