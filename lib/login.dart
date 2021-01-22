import 'package:cirs/services/employee-service.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Login extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login"),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Text(
                  'Dieses Login ist nur für Mitarbeiter des CIRS-Teams',

                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),


            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Geben Sie ihre Firmen E-Mail Adresse ein: z.B. abc@cirs.de'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Passwort',
                    hintText: 'Geben Sie Ihre zugehöriges Passwort ein'),
              ),
            ),
            SizedBox(height: 30.0,),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () async {
                  EmployeeService employeeService = EmployeeService(serverUrl);
                  bool result = await employeeService.login(emailController.text, passwordController.text);
                  final snackBar = result ?
                      SnackBar(
                        content: Text('Erfolgreich angemeldet', textAlign: TextAlign.center)
                      ) :
                      SnackBar(
                          content: Text('Email oder Passwort inkorrekt',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                          )
                      );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  if (result)
                    Navigator.popAndPushNamed(context, 'home');
                  else {
                    emailController.clear();
                    passwordController.clear();
                  }
                },
                child: Text(
                  'Absenden',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}