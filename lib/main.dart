import 'package:flutter/material.dart';
import 'home_page.dart';
import 'web_load_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Web View",
      routes: {
        "/": (context) => const WebPage(),
        "web_load_page": (context) => const WebLoad(),
      },
    ),
  );
}
