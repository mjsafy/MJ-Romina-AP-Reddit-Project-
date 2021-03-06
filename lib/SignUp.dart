import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/User.dart';

import 'Login.dart';

class SignUp extends StatefulWidget {
  final Function createUser;

  SignUp({Key key, this.createUser}) : super(key: key);

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
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Colors.purple,
              Colors.black,
              Colors.black,
              Colors.purple,
            ])),
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
                      hintText: "UserName",
                      prefixIcon: Icon(CupertinoIcons.profile_circled))),
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
                      hintText: "Password",
                      prefixIcon: Icon(Icons.key))),
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
            Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                width: w / 2.5,
                height: h / 12.5,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.deepOrange,
                          Colors.deepPurple,
                        ])),
                child: TextButton(
                    onPressed: () {
                      if (userNameC.text.isEmpty ||
                          passwordC.text.isEmpty ||
                          emailC.text.isEmpty)
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please Fill All of Fields'),
                          ),
                        );
                      else {
                        String userName = userNameC.text;
                        String password = passwordC.text;
                        String email = emailC.text;
                        User user = User(
                          username: userName,
                          password: password,
                          email: email,
                        );
                        widget.createUser(user);
                        userNameC.clear();
                        passwordC.clear();
                        emailC.clear();
                        () async {
                          await Socket.connect("10.0.2.2", 555).then(
                            (ss) {
                              ss.write("signup-" +
                                  userName +
                                  "-" +
                                  password +
                                  "-" +
                                  email);
                              ss.flush();
                              ss.listen((response) {
                                print(String.fromCharCodes(response));
                              });
                            },
                          );
                        };
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return Login(user: user);
                        }));
                      }
                    },
                    child: Text(
                      "Continue",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )))
          ],
        ),
      ),
    );
  }
}
