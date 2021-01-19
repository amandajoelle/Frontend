import 'package:cirs/services/medical-case-service.dart';
import 'package:flutter/material.dart';
import 'main.dart';


class Case extends StatefulWidget {
  static const routeName = '/Cases';

  Case();

  @override
  _CaseState createState() => _CaseState();
}

class _CaseState extends State<Case> {
  MedicalCase medicalCase;

  @override
  Widget build(BuildContext context) {
    final MedicalCase args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Text('Fallbeschreibung'),
                Text('Feedback')
              ],
            ),
            title: Text(args.title),
          ),
          body: TabBarView(
            children:  <Widget> [
            Center(
              // TODO:Widget with Constructor parameter args.questionnaire
            child: Text('Hier können sie die Beschreibung des Falles einsehen'),
          ),
            Center(
              // TODO: Widget with Constructor parameter with args.feedback
            child: Text('Hier könnensie das Feedback, zu dem abgeschlossenen Fall sehen'),
          )
            ],
          ),
        ),
      ),
    );
  }
}