import 'package:flutter/material.dart';
import 'Song_page.dart';
import 'home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Music Player",
    routes: {
      "/": (context) => HomePage(),
      "player": (context) => const AppMusicPlayer(),
    },
  ));
}
