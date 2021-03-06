import 'package:cirs/drawer/basic-items.dart';
import 'package:cirs/processing-cases.dart';
import 'package:cirs/services/token-storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cirs/login.dart';

import '../Incidents.dart';

class DrawerItems extends StatefulWidget {
  @override
  _DrawerItemsState createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {
  Stream _authState$ = TokenStorage().stream$;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _authState$,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.message),
                title: Text('Fälle bearbeiten'),
                onTap: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(builder: (context) => ProcessingCases()),
                  );
                },
              ),
              BasicItems(),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  TokenStorage().setToken(null);
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => Incidents())
                  );
                }
              ),
            ],
          );
        }
        return Column(
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.input),
                title: Text('Login'),
                onTap: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => Login()),
                  );
                }
            ),
            BasicItems(),
          ],
        );
      },
    );
  }
}