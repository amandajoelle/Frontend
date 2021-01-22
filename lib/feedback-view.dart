import 'package:cirs/main.dart';
import 'package:cirs/services/feedback-service.dart' as CirsFeedback;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedbackView extends StatefulWidget {
  final String _feedbackId;

  FeedbackView(this._feedbackId);

  @override
  _FeedbackView createState() => _FeedbackView(this._feedbackId);
}

class _FeedbackView extends State<FeedbackView> {
  final String _feedbackId;
  Future<CirsFeedback.Feedback> _future;
  CirsFeedback.FeedbackService _feedbackService;

  _FeedbackView(this._feedbackId) {
    this._feedbackService = CirsFeedback.FeedbackService(serverUrl);
    this._future = this._feedbackService.getFeedback(this._feedbackId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: this._future,
      builder: (BuildContext context,
          AsyncSnapshot<CirsFeedback.Feedback> snapshot) {
        List<Widget> children;
        if (snapshot.hasData) {
          children = <Widget>[
            Container(
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
                      if (snapshot.data.comment != null)
                        Text(snapshot.data.comment),

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
                      for (final factor in snapshot.data.factors) Text(
                        factor.content
                      )
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
                    Text(snapshot.data.solution),
                  ]),
                ],
              ),
            )
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
