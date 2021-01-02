
import 'package:cirs/drawer/drawer.dart';
import 'package:cirs/main.dart';
import 'package:cirs/services/medical-case-service.dart';
import 'package:flutter/material.dart';


class ProcessingCases extends StatelessWidget {
  static const String _title = 'Zu bearbeitende Fälle';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(title: const Text(_title)),
        body: MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MedicalCaseService medicalCaseService;
  Future<List<MedicalCase>> _cases;

  MyStatelessWidget({Key key}) : super(key: key) {
    medicalCaseService = MedicalCaseService(serverUrl);
    _cases = medicalCaseService.getAllIncompleteMedicalCases();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _cases,
        builder: (BuildContext context, AsyncSnapshot<List<MedicalCase>> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              DataTable(columns: [
                DataColumn(
                  label: Text(
                    'Fall-Nr',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Titel',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Bearbeiter',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ], rows: <DataRow>[
                for (final item in snapshot.data) DataRow(
                    onSelectChanged: (bool selected) {
                      if (selected) {
                        // TODO: navigate to next screen with routing parameters (item.caseId)
                      }
                    },
                    cells: <DataCell>[
                      DataCell(
                          Container(
                              width: 80,
                              child: Text(item.caseId)
                          )
                      ),
                      DataCell(
                          Container(
                              width: 110,
                              child: Text(item.title == null ? 'Ohne Titel' : item.title)
                          )
                      ),
                      DataCell(Text(item.editor == null ? '' : item.employee.lastname))
                    ],
                )
              ]
              )
            ];
          }
          else if(snapshot.hasError) {
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
          }
          else {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        }
    );
  }
}
