import 'package:flutter/material.dart';

String dropdownValue = 'One';

enum Gender { maennlich, weiblich, unbekannt }
Gender _gender = Gender.maennlich;

enum Job {
  Pflegepersonal,
  Arzt,
  Psychotherapeut,
  Apotheker,
  andere_Berufsgruppe
}
Job _job = Job.Pflegepersonal;

enum Frequency { nicht_anwendbar, taeglich, monatlich, jaehrlich, erstmalig }
Frequency _frequency = Frequency.nicht_anwendbar;

bool _checked = false;
int minLines = 3;
int maxLines = 5;

// Define a custom Form widget.
class Questions_First extends StatefulWidget {
  @override
  Questions_FirstState createState() {
    return Questions_FirstState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class Questions_FirstState extends State<Questions_First> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  int currentStep;
  bool complete;
  List<StepState> _listState;
  List<Step> steps;

  next() {
    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  createSteps() {
    steps = [
      Step(
        title: const Text('Zuständiges Fachgebiet'),
        isActive: currentStep == 0 ? true : false,
        state: currentStep == 0
            ? _listState[1]
            : currentStep > 0
                ? _listState[2]
                : _listState[0],
        content: Column(
          children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                /*setState(() {
                dropdownValue = newValue;
              });*/
              },
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          ],
        ),
      ),
      Step(
        title: const Text('Altersgruppe des Patienten'),
        subtitle: const Text("falls betroffen"),
        isActive: currentStep == 1 ? true : false,
        state: currentStep == 1
            ? _listState[1]
            : currentStep > 1
                ? _listState[2]
                : _listState[0],
        content: Column(
          children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                /*setState(() {
                dropdownValue = newValue;
              });*/
              },
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          ],
        ),
      ),
      Step(
        state: currentStep == 2
            ? _listState[1]
            : currentStep > 2
                ? _listState[2]
                : _listState[0],
        isActive: currentStep == 2 ? true : false,
        title: const Text('Geschlecht des Patienten'),
        subtitle: const Text("falls betroffen"),
        content: Column(
          children: <Widget>[
            ListTile(
              title: const Text("männlich"),
              leading: Radio(
                value: Gender.maennlich,
                groupValue: _gender,
                /*onChanged: (Gender value) {
                setState(() {
                _gender = value;
                });
              }*/
              ),
            ),
            ListTile(
              title: const Text("weiblich"),
              leading: Radio(
                value: Gender.weiblich,
                groupValue: _gender,
                /*onChanged: (Gender value) {
                setState(() {
                _gender = value;
                });
              }*/
              ),
            ),
            ListTile(
              title: const Text("unbekannt"),
              leading: Radio(
                value: Gender.unbekannt,
                groupValue: _gender,
                /*onChanged: (Gender value) {
                setState(() {
                _gender = value;
                });
              }*/
              ),
            ),
          ],
        ),
      ),
      Step(
        title: const Text('Wo ist das Ereignis passiert?'),
        isActive: currentStep == 3 ? true : false,
        state: currentStep == 3
            ? _listState[1]
            : currentStep > 3
                ? _listState[2]
                : _listState[0],
        content: Column(
          children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                /*setState(() {
                dropdownValue = newValue;
              });*/
              },
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          ],
        ),
      ),
      Step(
        title: const Text('Was ist passiert?'),
        isActive: currentStep == 4 ? true : false,
        state: currentStep == 4
            ? _listState[1]
            : currentStep > 4
                ? _listState[2]
                : _listState[0],
        content: Column(
          children: <Widget>[
            TextField(minLines: minLines, maxLines: maxLines),
          ],
        ),
      ),
      Step(
        title: const Text('Was war das Ergebnis?'),
        isActive: currentStep == 5 ? true : false,
        state: currentStep == 5
            ? _listState[1]
            : currentStep > 5
                ? _listState[2]
                : _listState[0],
        content: Column(
          children: <Widget>[
            TextField(minLines: minLines, maxLines: maxLines),
          ],
        ),
      ),
      Step(
        title: const Text(
            'Wo sehen Sie Gründe für dieses Ereignis und wie hätte es vermieden werden können?'),
        isActive: currentStep == 6 ? true : false,
        state: currentStep == 6
            ? _listState[1]
            : currentStep > 6
                ? _listState[2]
                : _listState[0],
        content: Column(
          children: <Widget>[
            TextField(minLines: minLines, maxLines: maxLines),
          ],
        ),
      ),
      Step(
        title: const Text('Welche Faktoren trugen zu dem Ereignis bei?'),
        subtitle: const Text('Mehrfachnennungen möglich'),
        isActive: currentStep == 7 ? true : false,
        state: currentStep == 7
            ? _listState[1]
            : currentStep > 7
                ? _listState[2]
                : _listState[0],
        content: Column(
          children: <Widget>[
            CheckboxListTile(
              title: const Text(
                  "Kommunikation (im Team, mit Patienten, mit anderen Ärzten etc.)"),
              value: _checked,
              /*onChanged: (bool value) {
                setState(() {
                _checked = value;
                });
              }*/
            ),
            CheckboxListTile(
              title: const Text("Ausbildung und Training"),
              value: _checked,
              /*onChanged: (bool value) {
                setState(() {
                _checked = value;
                });
              }*/
            ),
            CheckboxListTile(
              title: const Text(
                  "Persönliche Faktoren des Mitarbeiters (Müdigkeit, Gesundheit, Motivation etc.)"),
              value: _checked,
              /*onChanged: (bool value) {
                setState(() {
                _checked = value;
                });
              }*/
            ),
            CheckboxListTile(
              title: const Text(
                  "Teamfaktoren (Zusammenarbeit, Vertrauen, Kultur, Führung etc.)"),
              value: _checked,
              /*onChanged: (bool value) {
                setState(() {
                _checked = value;
                });
              }*/
            ),
            CheckboxListTile(
              title: const Text(
                  "Organisation (zu wenig Personal, Standards, Arbeitsbelastung, Abläufe etc.)"),
              value: _checked,
              /*onChanged: (bool value) {
                setState(() {
                _checked = value;
                });
              }*/
            ),
            CheckboxListTile(
              title: const Text(
                  "Patientenfaktoren (Sprache, Einschränkungen, med. Zustand etc.)"),
              value: _checked,
              /*onChanged: (bool value) {
                setState(() {
                _checked = value;
                });
              }*/
            ),
            CheckboxListTile(
              title: const Text(
                  "Technische Geräte (Funktionsfähigkeit, Bedienbarkeit etc.)"),
              value: _checked,
              /*onChanged: (bool value) {
                setState(() {
                _checked = value;
                });
              }*/
            ),
            CheckboxListTile(
              title: const Text(
                  "Kontext der Institution (Organisation des Gesundheitswesens etc.)"),
              value: _checked,
              /*onChanged: (bool value) {
                setState(() {
                _checked = value;
                });
              }*/
            ),
            CheckboxListTile(
              title: const Text("Medikation (Medikamente beteiligt?)"),
              value: _checked,
              /*onChanged: (bool value) {
                setState(() {
                _checked = value;
                });
              }*/
            ),
            CheckboxListTile(
              title: const Text("sonstiges:"),
              value: _checked,
              /*onChanged: (bool value) {
                setState(() {
                _checked = value;
                });
              }*/
            ),
          ],
        ),
      ),
      Step(
        state: currentStep == 8
            ? _listState[1]
            : currentStep > 8
                ? _listState[2]
                : _listState[0],
        isActive: currentStep == 8 ? true : false,
        title: const Text('Wie häufig tritt dieses Ereignis ungefähr auf?'),
        content: Column(
          children: <Widget>[
            ListTile(
              title: const Text("nicht anwendbar"),
              leading: Radio(
                value: Frequency.nicht_anwendbar,
                groupValue: _frequency,
                /*onChanged: (Gender value) {
                setState(() {
                _gender = value;
                });
              }*/
              ),
            ),
            ListTile(
              title: const Text("täglich"),
              leading: Radio(
                value: Frequency.taeglich,
                groupValue: _frequency,
                /*onChanged: (Gender value) {
                setState(() {
                _gender = value;
                });
              }*/
              ),
            ),
            ListTile(
              title: const Text("monatlich"),
              leading: Radio(
                value: Frequency.monatlich,
                groupValue: _frequency,
                /*onChanged: (Gender value) {
                setState(() {
                _gender = value;
                });
              }*/
              ),
            ),
            ListTile(
              title: const Text("jährlich"),
              leading: Radio(
                value: Frequency.jaehrlich,
                groupValue: _frequency,
                /*onChanged: (Gender value) {
                setState(() {
                _gender = value;
                });
              }*/
              ),
            ),
            ListTile(
              title: const Text("erstmalig"),
              leading: Radio(
                value: Frequency.erstmalig,
                groupValue: _frequency,
                /*onChanged: (Gender value) {
                setState(() {
                _gender = value;
                });
              }*/
              ),
            ),
          ],
        ),
      ),
      Step(
        state: currentStep == 9
            ? _listState[1]
            : currentStep > 9
                ? _listState[2]
                : _listState[0],
        isActive: currentStep == 9 ? true : false,
        title: const Text('Wer berichtet?'),
        subtitle: const Text("Berufsgruppe"),
        content: Column(
          children: <Widget>[
            ListTile(
              title: const Text("Pflege-, Praxispersonal"),
              leading: Radio(
                value: Job.Pflegepersonal,
                groupValue: _job,
                /*onChanged: (Gender value) {
                setState(() {
                _gender = value;
                });
              }*/
              ),
            ),
            ListTile(
              title: const Text("Arzt / Ärztin, Psychotherapeut/in"),
              leading: Radio(
                value: Job.Arzt,
                groupValue: _job,
                /*onChanged: (Gender value) {
                setState(() {
                _gender = value;
                });
              }*/
              ),
            ),
            ListTile(
              title: const Text("Apotheker / Apothekerin"),
              leading: Radio(
                value: Job.Apotheker,
                groupValue: _job,
                /*onChanged: (Gender value) {
                setState(() {
                _gender = value;
                });
              }*/
              ),
            ),
            ListTile(
              title: const Text("andere Berufsgruppe"),
              leading: Radio(
                value: Job.andere_Berufsgruppe,
                groupValue: _job,
                /*onChanged: (Gender value) {
                setState(() {
                _gender = value;
                });
              }*/
              ),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState

    currentStep = 0;
    complete = false;

    _listState = [
      StepState.indexed,
      StepState.editing,
      StepState.complete,
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    createSteps();
    return new Scaffold(
        body: Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
        child: Text(
          "Bitte beachten Sie, alle Angaben anonym zu beschreiben. "
          "Geben Sie bitte keine Namen oder konkrete Orte an.",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
      Expanded(
        child: Stepper(
          steps: steps,
          currentStep: currentStep,
          onStepContinue: next,
          onStepTapped: (step) => goTo(step),
          onStepCancel: cancel,
        ),
      ),
      ButtonBar(
        alignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            color: Colors.blue,
            onPressed: () {},
            child: Text(
              'Zurück',
              style: TextStyle(color: Colors.white),
            ),
          ),
          FlatButton(
            color: Colors.blue,
            onPressed: () {},
            child: Text(
              'Reset',
              style: TextStyle(color: Colors.white),
            ),
          ),
          FlatButton(
            color: Colors.blue,
            onPressed: () {},
            child: Text(
              'Abschicken',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ]));
  }
}
