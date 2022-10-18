import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  setData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('login', true);
  }

  @override
  void initState() {
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/intro2.png"),
            SizedBox(height: 50),
            const Text(
              "Welcome to home page",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
