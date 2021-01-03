import 'package:flutter/material.dart';

String dropdownValue = 'One';
enum Gender { maennlich, weiblich, unbekannt }
Gender _gender = Gender.maennlich;

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

  int currentStep = 0;
  bool complete = false;

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

  List<Step> steps = [
    Step(
      title: const Text('Zuständiges Fachgebiet'),
      isActive: true,
      state: StepState.editing,
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
      isActive: false,
      state: StepState.editing,
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
      state: StepState.editing,
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
      isActive: false,
      state: StepState.editing,
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
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
         body: Column(children: <Widget>[
          Expanded(
            child: Stepper(
              steps: steps,
              currentStep: currentStep,
              onStepContinue: next,
              onStepTapped: (step) => goTo(step),
              onStepCancel: cancel,
            ),
          ),
        ]));
  }
}
