import 'package:cirs/form/form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BasicItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Bericht erstellen'),
          onTap: () {
            Navigator.push(
              context,
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
  }
  
}