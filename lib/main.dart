import 'package:cirs/services/employee-service.dart';
import 'package:cirs/services/factor-service.dart';
import 'package:cirs/services/questionnaire-service.dart';
import 'package:cirs/services/token-storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('de', ''), // German, no country code
      ],
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  // just for testing purposes
  // TODO: remove function after testing
  void loginUser() async {
    EmployeeService employeeService = EmployeeService('http://10.0.2.2:8080');
    await employeeService.login('Mueller@cirs.de', '123456789');
    TokenStorage tokenStorage = TokenStorage();
    print('Token was stored: '+ tokenStorage.getToken());
  }

  // just for testing purposes
  // TODO: remove function after testing
  void getQuestionnaireTest() async {
    QuestionnaireService questionnaireService = QuestionnaireService('http://10.0.2.2:8080');
    await questionnaireService.getQuestionnaire('089e25c8-f012-4cc7-bfdb-bb944ff611c3');
  }

  // just for testing purposes
  // TODO: remove function after testing
  void postQuestionnaireTest() async {
    Questionnaire questionnaire = Questionnaire(expertise: 'Innere Medizin', ageGroup: '51-60', sex: 'männlich', location: 'Krankenhaus',
        event: 'Pat. hat die Tabletten des Nachbarpatienten eingenommen, diese wirken gegen hohen Blutdruck, Cholesterinsenker, und Pulssenker, ärztliche Person informiert, regelmäßige Kontrolle von Blutdruck und Puls.',
        result: 'Meldung an ärztliche Person der Station, Überwachung der Vitalparameter. Kein Schaden.',
        reasons: 'Verminderte Aufmerksamkeit über Gesamtsituation im Zimmer.\nAufnahme und Analyse im Projekt "AMTS Stellen und Verabreichen". Die Analyse zeigt, dass es hier eine Verwechselung durch den Patienten gegeben hat. Eine Beschriftung war auf dem "Tablettenpöttchen" vorhanden. Beide Patienten wurden auf Zimmerebene mobilisiert und sollten gemeinsam am Tisch essen. Dabei ist es zur versehentlichen Einnahme der Tabletten gekommen.\nEmpfehlung: Vor Ort bei der Einnahme der Tabletten dabei bleiben. Insbesondere wenn der medizinisch-pflegerische Zustand des Patienten darauf hindeuten, dass der Grad der Selbstständigkeit diesbezüglich eingeschränkt ist. Vor der Verabreichung sollte eine Einzelkontrolle (Abgleich Anordnung und Medikament) stattfinden. Die eindeutige Beschriftung und der Abgleich mit dem Patienten (Ansprache, Identifikationsarmband) tragen zur eindeutigen Identifikation des richtigen Patienten bei.',
        frequency: 'nicht anwendbar', reporter: 'Pflege-, Praxispersonal', factors: [
          Factor(content: 'Kommunikation (im Team, mit Patienten, mit anderen Ärzten etc.)'),
          Factor(content: 'Organisation (zu wenig Personal, Standards, Arbeitsbelastung, Abläufe etc.)'),
          Factor(content: 'Patientenfaktoren (Sprache, Einschränkungen, med. Zustand etc.)')
        ]);
    QuestionnaireService questionnaireService = QuestionnaireService('http://10.0.2.2:8080');
    await questionnaireService.postQuestionnaire(questionnaire);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: MyDrawer(),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: postQuestionnaireTest, //_incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
