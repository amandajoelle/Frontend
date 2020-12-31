import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          )
        ]));
  }
}