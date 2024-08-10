import 'package:flutter/material.dart';
import 'welcomescreenwidget.dart';
import 'homepagewidget.dart';
import 'scanpagewidget.dart';
import 'resultpagewidget.dart';
import 'actionspagewidget.dart';
import 'awarenesspagewidget.dart';
import 'chat_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EnviLens',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>
            WelcomescreenWidget(), // Set the initial route to the welcome screen
        '/home': (context) => HomepageWidget(),
        '/scan': (context) => ScanPageWidget(),
        '/actions': (context) => ActionsPageWidget(),
        '/awareness': (context) => AwarenessPageWidget(),
        '/chat': (context) => ChatPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/result') {
          final result = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) => ResultPageWidget(result: result),
          );
        }
        return null; // Return null if the route is not found
      },
    );
  }
}
