import 'package:flutter/material.dart';
import 'main.dart';

class EditCase extends StatefulWidget {
  @override
  EditCaseState createState() {
    return EditCaseState();
  }
}

class EditCaseState extends State<EditCase> {
  int minLines = 1;
  int maxLines = 1;
  int maxFactors = 5;
  int maxLength = 40;
  int myIndex = 0;

  List<Row> rowList = [];
  Row myRow;

  void remove(int index) {
    setState(() {
      rowList.removeAt(index);
    });
  }

  void add(Row row) {
    if (!(maxFactors == rowList.length)) {
      setState(() {
        rowList.add(row);
      });
    }
  }

  @override
  void initState() {
    super.initState();

    myRow = new Row(
      children: [
        Expanded(
          child: TextField(
              minLines: minLines,
              maxLines: maxLines,
              maxLength: maxLength,
              maxLengthEnforced: true),
        ),
        SizedBox(
          width: 20,
        ),
        Center(
          child: Ink(
              decoration: const ShapeDecoration(
                color: Colors.lightBlue,
                shape: CircleBorder(),
              ),
              child: IconButton(
                  icon: Icon(Icons.remove),
                  color: Colors.white,
                  onPressed: () {
                    remove(myIndex);
                  })),
        ),
      ],
    );

    rowList.add(myRow);
    rowList.add(myRow);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                new SliverAppBar(
                  pinned: true,
                  title: new Text('Fall bearbeiten'),
                ),
              ];
            },
            body: Column(
              children: <Widget>[
                Text('Hier können Sie die Beschreibung des Falles einsehen'),
                FlatButton(
                  color: Colors.blue,
                  onPressed: () {
                  },
                  child: Text(
                    'Fallbeschreibung',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: 30,
                  indent: 10,
                  endIndent: 10,
                  thickness: 1.5,
                ),
                Text('Fachkommentar:', style: TextStyle(fontWeight: FontWeight.bold)),
                TextField(minLines: minLines, maxLines: maxLines),
                Text(
                    'Beitragende Faktoren werden im Fallbericht angegeben und können sein:', style: TextStyle(fontWeight: FontWeight.bold)),
                Container(
                  height: 200,
                  child: ListView.builder(
                      itemCount: rowList.length,
                      itemBuilder: (context, index) {
                        myIndex = index;
                        //final item = rowList[index];
                        return Row(
                          children: [
                            Expanded(
                              child: TextField(
                                  minLines: minLines,
                                  maxLines: maxLines,
                                  maxLength: maxLength,
                                  maxLengthEnforced: true),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Center(
                              child: Ink(
                                decoration: const ShapeDecoration(
                                  color: Colors.lightBlue,
                                  shape: CircleBorder(),
                                ),
                                child: IconButton(
                                  icon: Icon(Icons.remove),
                                  color: Colors.white,
                                  onPressed: () {
                                    remove(index);
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                        /*Dismissible(
                          key: Key(value),
                          direction: DismissDirection.startToEnd,
                          child: myRow,
                          onDismissed: (direction) {
                            setState(() {
                              rowList.removeAt(index);
                            });
                          }
                      );*/
                      }),
                ),
                Center(
                  child: Ink(
                    decoration: const ShapeDecoration(
                      color: Colors.lightBlue,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add),
                      color: Colors.white,
                      onPressed: () {
                        add(myRow);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Lösungsvorschlag:', style: TextStyle(fontWeight: FontWeight.bold),),
                TextField(minLines: 1, maxLines: 5),
                ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      color: Colors.blue,
                      onPressed: () {},
                      child: Text(
                        'Abbrechen',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    FlatButton(
                      color: Colors.blue,
                      onPressed: () {},
                      child: Text(
                        'Speichern',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    FlatButton(
                      color: Colors.blue,
                      onPressed: () {},
                      child: Text(
                        'Abschließen',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}