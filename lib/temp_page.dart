import 'package:flutter/material.dart';

class Temp extends StatefulWidget {
  const Temp({Key key}) : super(key: key);

  @override
  State<Temp> createState() => _TempState();
}

class _TempState extends State<Temp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Temp"),
        centerTitle: true,
      ),
    );
  }
}
