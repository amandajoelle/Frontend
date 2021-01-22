import 'package:cirs/main.dart';
import 'package:cirs/services/questionnaire-service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionnaireView extends StatefulWidget {
  final String _questionnaireId;

  QuestionnaireView(this._questionnaireId);

  @override
  _QuestionnaireViewState createState() =>
      _QuestionnaireViewState(this._questionnaireId);
}

class _QuestionnaireViewState extends State<QuestionnaireView> {
  final String _questionnaireId;
  Future<Questionnaire> _questionnaire;
  QuestionnaireService questionnaireService;

  _QuestionnaireViewState(this._questionnaireId) {
    this.questionnaireService = QuestionnaireService(serverUrl);
    this._questionnaire =
        this.questionnaireService.getQuestionnaire(this._questionnaireId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questionnaire,
      builder: (BuildContext context, AsyncSnapshot<Questionnaire> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  /// Zuständiges Fachgebiet
                  Column(
                    children: <Widget>[
                      Text(
                        "Zuständiges Fachgebiet:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(snapshot.data.expertise),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  /// Altersgruppe des Patienten
                  Column(
                    children: <Widget>[
                      Text(
                        "Altersgruppe des Patienten:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(snapshot.data.ageGroup),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  /// Geschlecht des Patienten
                  Column(children: <Widget>[
                    Text(
                      "Geschlecht des Patienten:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(snapshot.data.sex),
                  ]),
                  SizedBox(
                    height: 10.0,
                  ),

                  /// Wo ist das Ereignis passiert?
                  Column(
                    children: <Widget>[
                      Text(
                        "Wo ist das Ereignis passiert?:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(snapshot.data.location),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  /// Was ist  passiert?
                  Column(
                    children: <Widget>[
                      Text(
                        "Was ist passiert?:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(snapshot.data.event),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  /// Was war das Ergebnis?
                  Column(
                    children: <Widget>[
                      Text(
                        'War war das Ergebnis?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(snapshot.data.result),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  /// Wo sehen Sie Gründe für dieses Ereignis und wie hätte es vermieden werden können?
                  Column(
                    children: <Widget>[
                      Text(
                        "Wo sehen Sie Gründe für dieses Ereignis und wie hätte es vermieden werden können?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(snapshot.data.reasons),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  /// Welche Faktoren trugen zu dem Ereignis bei?
                  Column(
                    children: <Widget>[
                      Text(
                        " Welche Faktoren trugen zu dem Ereignis bei?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      for (final factor in snapshot.data.factors) Text(
                        factor.content
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  /// Wie häufig tritt dieses Ereignis ungefähr auf?
                  Column(
                    children: <Widget>[
                      Text(
                        "Wie häufig tritt dieses Ereignis ungefähr auf?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(snapshot.data.frequency),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  ///Wer berichtet?
                  Column(
                    children: <Widget>[
                      Text(
                        "Wer berichtet?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(snapshot.data.reporter),
                    ],
                  ),
                ],
              ),
            ),
          ];
        } else if (snapshot.hasError) {
          children = <Widget>[
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text('Error: ${snapshot.error}'),
            )
          ];
        } else {
          children = <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
              width: 60,
              height: 60,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Lade Daten...'),
            )
          ];
        }
        return Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          ),
        );
      },
    );
  }
}
