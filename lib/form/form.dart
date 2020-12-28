import 'package:cirs/form/questions_first.dart';
import 'package:cirs/form/questions_second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Report_Questionnaire extends StatefulWidget {
  @override
  _Report_QuestionnaireState createState() => _Report_QuestionnaireState();
}

class _Report_QuestionnaireState extends State<Report_Questionnaire> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: DefaultTabController(
          length: 2, // The number of tabs
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                tabs: [
                  Tab(text: "1"),
                  Tab(text: "2")
                ],
              ),
              title: Text("Bericht erstellen"),
            ),
            body: TabBarView(
              children: [
                Questions_First(),
                Questions_Second()
              ],
            ), // Complete this code in the next step.
          ),
        ),
      ),
    );
  }
}