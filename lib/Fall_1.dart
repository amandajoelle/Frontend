import 'package:flutter/material.dart';
import 'main.dart';


class Falls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Text('Fallbescreibung'),
                Text('Feedback')
              ],
            ),
            title: Text('Fall'),
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