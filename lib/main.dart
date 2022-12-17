import 'package:flutter/material.dart';
import 'audio_page.dart';
import 'home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        'audio_page': (context) => const AudioPage(),
      },
    ),
  );
}
