import 'package:cirs/services/medical-case-service.dart';
import 'package:flutter/material.dart';
import 'main.dart';


class Cases extends StatelessWidget {
  MedicalCase medicalCase;
  Cases(this.medicalCase);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Text(medicalCase.questionnaire),
                Text(medicalCase.feedback)
              ],
            ),
            title: Text(medicalCase.title),
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