import 'package:flutter/material.dart';
import 'web_load_page.dart';
import 'web_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Web View",
      routes: {
        "/": (context) => const WebPage(),
        "web": (context) => const WebLoad(),
      },
    ),
  );
}
