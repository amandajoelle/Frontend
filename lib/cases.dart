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
              Center(
                // TODO:Widget with Constructor parameter args.questionnaire

                //child: Text(args.questionnaire),
                child: _questionnaireShower(args.questionnaire),
              ),
              Center(
                // TODO: Widget with Constructor parameter with args.feedback
                child: _feedbackShower(args.feedback),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _questionnaireShower(String questionnaire) {
    var temp = StringSplitter.split(questionnaire, splitters: [':', ',']);

    return Container(
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
              Text(temp[3].toString()),
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
              Text(temp[5].toString()),
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
            Text(temp[7].toString()),
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
              Text(temp[9].toString()),
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
              Text(temp[11].toString()),
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
              Text(temp[13].toString()),
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
              Text(temp[15].toString()),
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
              Text(temp[17].toString()),
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
              Text(temp[19].toString()),
            ],
          ),
        ],
      ),
    );
  }
}


Widget _feedbackShower(String feedback) {
  var tmp = StringSplitter.split(feedback, splitters: [':', ',']);

  return Container(
    child: Column(
      children: <Widget>[
        /// Fachkommentar:
        Column(
          children: <Widget>[
            Text(
              "Fachkommentar:",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(tmp[1].toString()),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),

        /// Beitragende Faktoren werden im Fallbericht angegeben und Können sein:
        Column(
          children: <Widget>[
            Text(
              "Beitragende Faktoren werden im Fallbericht angegeben und Können sein:",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(tmp[3].toString()),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),

        /// Lösungsvorschlag:
        Column(children: <Widget>[
          Text(
            "Lösungsvorschlag:",
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(tmp[5].toString()),
        ]),
      ],
    ),
  );
}

