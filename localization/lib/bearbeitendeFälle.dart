
import 'package:flutter/material.dart';

import 'NavDrawer.dart';


class Bearbeitende extends StatelessWidget {
  static const String _title = 'Zu bearbeitende Fälle';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(title: const Text(_title)),
        body: MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
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
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('0001')),
            DataCell(Text('Fall_1')),
            DataCell(Text('Meier')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('0002')),
            DataCell(Text('Fall_2')),
            DataCell(Text('Müller')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('0003')),
            DataCell(Text('Fall_3')),
            DataCell(Text('')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('0004')),
            DataCell(Text('Fall_4')),
            DataCell(Text('')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('0005')),
            DataCell(Text('Fall_5')),
            DataCell(Text('Meier')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('0006')),
            DataCell(Text('Fall_6')),
            DataCell(Text('Musermann')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('0007')),
            DataCell(Text('Fall_7')),
            DataCell(Text('Musterfrau')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('0008')),
            DataCell(Text('Fall_8')),
            DataCell(Text('')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('0009')),
            DataCell(Text('Fall_9')),
            DataCell(Text('')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('0010')),
            DataCell(Text('Fall_10')),
            DataCell(Text('')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('0011')),
            DataCell(Text('Fall_11')),
            DataCell(Text('Müller')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('0012')),
            DataCell(Text('Fall_12')),
            DataCell(Text('Musterfrau')),
          ],
        ),
      ],
    );
  }
}
