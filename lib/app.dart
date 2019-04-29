import 'package:first_project/ui/screens/animal_adopt_success.dart';
import 'package:first_project/ui/screens/animal_index.dart';
import 'package:first_project/ui/screens/animal_register.dart';
import 'package:first_project/ui/screens/animal_register_success.dart';
import 'package:first_project/ui/screens/interesteds_screen.dart';
import 'package:first_project/ui/screens/my_pets.dart';
import 'package:flutter/material.dart';
import 'package:first_project/ui/screens/login.dart';
import 'package:first_project/ui/screens/home.dart';
import 'package:first_project/ui/screens/register.dart';
import 'package:first_project/ui/screens/user_view.dart';

class MeauApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meau',
      initialRoute: '/home',
      routes: {
        // If you're using navigation routes, Flutter needs a base route.
        // We're going to change this route once we're ready with
        // implementation of HomeScreen.
        '/': (context) => Home(),
        '/home': (context) => Home(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/user_view:': (context) => UserView(),
        '/animal_register': (context) => AnimalRegisterScreen(),
        '/animal_register_success': (context) => AnimalRegisterSuccess(),
        //'/animal_index': (context) => AnimalIndexScreen(),
        '/my_pets': (context) => MyPetsScreen(),
        '/animal_adopt_sucess': (context) => AnimalAdoptSuccess(),
        //'/interesteds': (context) => interestedsScreen(),
      },
    );
  }
}