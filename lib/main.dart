import 'package:flutter/material.dart';
import 'screens/cases_info.dart';
import 'screens/homepage.dart';
import 'screens/recent_condition.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'homepage',
      routes: {
        'homepage': (context) => const HomePage(),
        'cases': (context) => const CasesInfoPage(),
        'recent': (context) => const RecentCases(),
      },
    ),
  );
}
