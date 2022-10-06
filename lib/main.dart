import 'package:flutter/material.dart';
import 'package:outcaster5/home_page.dart';
import 'package:outcaster5/temp_page.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        'temp_page': (context) => Temp(),
      },
    ),
  );
}


