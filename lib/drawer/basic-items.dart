import 'package:cirs/Incidents.dart';
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
              MaterialPageRoute(builder: (context) => ReportQuestionnaire()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Vorfälle ansehen'),
           onTap: () {
             Navigator.push(context,
                 MaterialPageRoute(builder: (context) => Incidents()));
           }
        ),
        ListTile(
          leading: Icon(Icons.info_rounded),
          title: Text('Über'),
          onTap: () {
            showAboutDialog(
                context: context,
                applicationName: 'CIRS App',
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text('Informationen über die CIRS App'),
                  )
                ]
            );
          }
        ),
      ],
    );
  }
  
}