import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Global.dart';
import 'home_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return (Global.isAndroid == false)
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: buildMaterialColor(Global.appColor),
            ),
            home: const HomePage(),
          )
        : CupertinoApp(
            theme: CupertinoThemeData(
              primaryColor: buildMaterialColor(Global.appColor),
            ),
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );
  }
}
