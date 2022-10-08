import 'package:flutter/material.dart';
import 'package:ocstar_6/home_page.dart';
import 'splashscreen_page.dart';
import 'stepper_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splashscreen',
    routes: {
      'splashscreen_page': (context) => SplashScreen(),
      '/': (context) => registration(),
      'home_page': (context) => HomePage(),
    },
  ));
}
