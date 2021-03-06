import 'package:flutter/material.dart';

String dropdownValue = 'One';

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

// Define a custom Form widget.
class Questions_Third extends StatefulWidget {
  @override
  Questions_ThirdState createState() {
    return Questions_ThirdState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class Questions_ThirdState extends State<Questions_Third> {
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
      title: const Text('Welche Faktoren trugen zu dem Ereignis bei?'),
      subtitle: const Text('Mehrfachnennungen möglich'),
      isActive: true,
      state: StepState.editing,
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
      state: StepState.editing,
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
      state: StepState.editing,
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
