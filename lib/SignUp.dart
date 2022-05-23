import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userNameC;
  TextEditingController passwordC;
  TextEditingController emailC;

  @override
  void initState() {
    userNameC = TextEditingController();
    passwordC = TextEditingController();
    emailC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userNameC.dispose();
    passwordC.dispose();
    emailC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: TextField(
                  controller: userNameC,
                  decoration: const InputDecoration(
                      fillColor: Colors.tealAccent,
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      hintText: "userName")),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: TextField(
                  controller: passwordC,
                  decoration: const InputDecoration(
                      fillColor: Colors.tealAccent,
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      hintText: "Password")),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: TextField(
                controller: emailC,
                decoration: const InputDecoration(
                    fillColor: Colors.tealAccent,
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
