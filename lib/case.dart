import 'package:cirs/feedback-view.dart';
import 'package:cirs/questionnaire-view.dart';
import 'package:cirs/services/medical-case-service.dart';
import 'package:cirs/services/questionnaire-service.dart';
import 'package:string_splitter/string_splitter.dart';
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
              tabs: [Text('Fallbeschreibung'), Text('Feedback')],
            ),
            title: Text(args.title),
          ),
          body: TabBarView(
            children: <Widget>[
              QuestionnaireView(args.questionnaire),
                // child: _questionnaireShower(args.questionnaire),
              FeedbackView(args.feedback),
            ],
          ),
        ),
      ),
    );
  }
}

