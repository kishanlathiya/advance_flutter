import 'package:flutter/material.dart';
import 'homepage.dart';
import 'slider.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'homepage',
      routes: {
        'homepage': (context) => const HomePage(),
        'slider': (context) => const Photo_slider(),
      },
    ),
  );
}
