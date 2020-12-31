import 'package:cirs/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'NavDrawer.dart';
import 'login.dart';
import 'bearbeitendeFälle.dart';

void main() {
  //runApp(MyApp());
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CIRS APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'home': (context) =>  MyHomePage(),
        'login': (context) => Login(),
        'Bearbeiten': (context) => Bearbeitende(),
      },
      initialRoute: 'home',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('CIRS APP'),
      ),
      body: Center(
        child: Text('Willkommen In der Critical Incedent Reporting System App',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

