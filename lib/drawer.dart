import 'package:flutter/material.dart';

ListView lv = new ListView(
  padding: EdgeInsets.zero,
  //TODO: Change Icons
  children: const <Widget>[
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

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: lv);
  }
}
