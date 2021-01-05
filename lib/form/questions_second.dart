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
int minLines = 3;
int maxLines = 5;

// Define a custom Form widget.
class Questions_Second extends StatefulWidget {
  @override
  Questions_SecondState createState() {
    return Questions_SecondState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class Questions_SecondState extends State<Questions_Second> {
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
      title: const Text('Was ist passiert?'),
      isActive: true,
      state: StepState.editing,
      content: Column(
        children: <Widget>[
          TextField(minLines: minLines, maxLines: maxLines),
        ],
      ),
    ),
    Step(
      title: const Text('Was war das Ergebnis?'),
      isActive: false,
      state: StepState.editing,
      content: Column(
        children: <Widget>[
          TextField(minLines: minLines, maxLines: maxLines),
        ],
      ),
    ),
    Step(
      title: const Text(
          'Wo sehen Sie Gründe für dieses Ereignis und wie hätte es vermieden werden können?'),
      isActive: false,
      state: StepState.editing,
      content: Column(
        children: <Widget>[
          TextField(minLines: minLines, maxLines: maxLines),
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
