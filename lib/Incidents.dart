import 'package:cirs/Cases.dart';
import 'package:flutter/material.dart';
import 'drawer/nav-drawer.dart';
import 'package:flutter/material.dart';
import 'package:cirs/drawer/drawer.dart';
import 'package:cirs/main.dart';
import 'package:cirs/services/medical-case-service.dart';
import 'package:cirs/services/employee-service.dart';

class Incidents extends StatefulWidget {
  static const routeName = '/Incidents';
  @override
  _IncidentsState createState() => _IncidentsState();
}

/// This is the stateless widget that the main application instantiates.
class _IncidentsState extends State<Incidents> {
  static const String _title = 'Fälle';
  MedicalCaseService _medicalCaseService;
  Future<List<MedicalCase>> _cases;

  _IncidentsState() {
    _medicalCaseService = MedicalCaseService(serverUrl);
    _cases = _medicalCaseService.getAllDoneMedicalCases();
  }

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: _title,
      home: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(title: const Text(_title)),
        body: FutureBuilder(
            future: _cases,
            builder: (BuildContext context, AsyncSnapshot<List<MedicalCase>> snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                children = <Widget>[
                  DataTable(
                      showCheckboxColumn: false,
                      columns: [
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
                            GestureDetector(
                              onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    MedicalCase result;
                                    _medicalCaseService.getMedicalCase(item.caseId).then((value) => result = value);
                                    return new Cases(result);
                                  },
                                  // settings: new RouteSettings(
                                  //   name: "name",
                                  //   arguments: {"arg1", "arg2"},
                                  // )
                              )),
                                  child: Container(
                                  width: 110,
                                  child: Text(item.title == null ? 'Ohne Titel' : item.title)
                              ),
                            )
                        ),
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
        ),
      ),
    );
  }
}
