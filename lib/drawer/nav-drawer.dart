import 'package:flutter/material.dart';
import '../login.dart';
import '../processing-cases.dart';
import '../main.dart';

class NavDrawer extends StatelessWidget {
  navigateToPage(BuildContext context, String page) {
    Navigator.of(context).pushNamedAndRemoveUntil(page, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menü',
              textAlign : TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
            // TODO: Remove Image
            /* decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('C:\Users\Amanda\AndroidStudioProjects\localization\image/Hintergrund.jpg'))), */
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Login'),
           // onTap: () => {Navigator.of(context).pop()},
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => Login()),
                );
              }
          ),
          ListTile(
            leading: Icon(Icons.business_center),
            title: Text('Fälle bearbeiten'),
           // onTap: () => {Navigator.of(context).pop()},
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => ProcessingCases()),
                );
              }
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Bericht erstellen'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Vorfälle ansehen'),
            //onTap: () => {Navigator.of(context).pop()},
              onTap: () {
                Navigator.push(
                  context,
                 new MaterialPageRoute(builder: (context) => ProcessingCases()),
                );
              }

          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Über'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}