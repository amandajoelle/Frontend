import 'package:cirs/services/medical-case-service.dart';
import 'package:flutter/material.dart';
import 'main.dart';


class Cases extends StatelessWidget {
  static const routeName = '/Cases';
  MedicalCase medicalCase;
  Cases(this.medicalCase);
  @override
  Widget build(BuildContext context) {
    final MedicalCase args = ModalRoute.of(context).settings.arguments;
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Text(args.questionnaire),
                Text(args.feedback)
              ],
            ),
            title: Text(args.title),
          ),
          body: TabBarView(
            children:  <Widget> [
            Center(
            child: Text('Hier können sie die Beschreibung des Falles einsehen'),
          ),
            Center(
            child: Text('Hier könnensie das Feedback, zu dem abgeschlossenen Fall sehen'),
          )
            ],
          ),
        ),
      ),
    );
  }
}