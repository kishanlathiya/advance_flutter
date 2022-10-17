import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final signup = prefs.getBool('signup') ?? false;
  final login = prefs.getBool('login') ?? false;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: (signup)
        ? (login)
            ? "welcome_page"
            : "login_page"
        : "/",
    routes: {
      "/": (context) => const SignUpPage(),
      "login_page": (context) => const LoginPage(),
      "welcome_page": (context) => const WelcomePage(),
    },
  ));
}
