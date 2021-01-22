import 'package:cirs/case.dart';
import 'package:cirs/Incidents.dart';
import 'package:cirs/form/form.dart';
import 'package:cirs/processing-cases.dart';
import 'package:cirs/login.dart';
import 'package:flutter/material.dart';
import 'drawer/drawer.dart';
import 'Incidents.dart';

final String serverUrl = 'http://10.0.2.2:8080';

void main() {
  runApp(MyApp());
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
        'Incidents':(context) => Incidents(),
        'Case':(context) => Case(),
        'to_process': (context) => ProcessingCases(),
        'report': (context) => ReportQuestionnaire(),
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
      drawer: MyDrawer(),
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