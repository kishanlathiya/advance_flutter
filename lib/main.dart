import 'package:flutter/material.dart';
import 'web_view_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Web View",
      routes: {
        "/": (context) => const WebView(),
      },
    ),
  );
}
