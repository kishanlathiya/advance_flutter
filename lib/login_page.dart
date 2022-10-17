import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLPasswordShow = false;
  bool isCheckbox = false;
  TextEditingController lEmailController = TextEditingController();
  TextEditingController lPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 90,
              width: double.infinity,
            ),
            Image.asset(
              "images/login.png",
              scale: 3,
              height: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Login In",
              style: GoogleFonts.dellaRespira(fontSize: 25),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Please login here  to continue",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              alignment: Alignment.center,
              child: TextField(
                controller: lEmailController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Email",
                  hintStyle: TextStyle(fontSize: 13),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      obscureText: isLPasswordShow,
                      controller: lPasswordController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon((isLPasswordShow)
                        ? Icons.visibility
                        : Icons.visibility_off),
                    color: Colors.grey,
                    onPressed: () {
                      setState(() {
                        isLPasswordShow = !isLPasswordShow;
                      });
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Checkbox(
                      value: isCheckbox,
                      onChanged: (val) async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('login', val!);
                        setState(() {
                          isCheckbox = val;
                        });
                      }),
                  const Text(
                    "I agree to the Terms and conditions",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                if (lPasswordController.text.isNotEmpty &&
                    lEmailController.text.isNotEmpty) {
                  final prefs = await SharedPreferences.getInstance();
                  if (prefs.getString('email') == lEmailController.text &&
                      prefs.getString('password') == lPasswordController.text) {
                    Navigator.of(context).pushReplacementNamed("welcome_page");
                  }
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
                alignment: Alignment.center,
                child: const Text(
                  "Log In",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed("/");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
