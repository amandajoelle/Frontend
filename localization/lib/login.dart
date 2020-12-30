import 'package:flutter/material.dart';
import 'NavDrawer.dart';
class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Text('Login'),
      ),
    );
  }
}