import 'package:flutter/material.dart';
import 'package:first_project/ui/screens/login.dart';
import 'package:first_project/ui/screens/home.dart';

class MeauApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meau',
      initialRoute: '/login',
      routes: {
        // If you're using navigation routes, Flutter needs a base route.
        // We're going to change this route once we're ready with
        // implementation of HomeScreen.
        '/': (context) => Home(),
        '/login': (context) => Home(),
      },
    );
  }
}