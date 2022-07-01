import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reddit/User.dart';

class Profile extends StatefulWidget {
  User me;
  Profile({this.me, Key key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController userNameC;
  TextEditingController passwordC;
  TextEditingController emailC;
  TextEditingController password2C;

  @override
  void initState() {
    userNameC = TextEditingController();
    passwordC = TextEditingController();
    emailC = TextEditingController();
    password2C = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userNameC.dispose();
    passwordC.dispose();
    emailC.dispose();
    password2C.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
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
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.deepPurple,
                        Colors.deepOrange,
                      ]),
                  border: Border(bottom: BorderSide(width: 1))),
              child: Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: w / 5, vertical: 20),
                    child: Text(
                      "Name",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(widget.me.name),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.deepOrange,
                        Colors.deepPurple,
                      ]),
                  border: Border(bottom: BorderSide(width: 1))),
              child: Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: w / 5, vertical: 20),
                    child: Text("Email",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(widget.me.email),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.deepPurple,
                        Colors.deepOrange,
                      ]),
                  border: Border(bottom: BorderSide(width: 1))),
              child: Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: w / 5, vertical: 20),
                    child: Text("   Id   ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(widget.me.id),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
              child: TextField(
                controller: userNameC,
                decoration: InputDecoration(
                  hintText: "Enter Your New UserName",
                  fillColor: Colors.tealAccent,
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
              child: TextField(
                controller: passwordC,
                decoration: InputDecoration(
                  fillColor: Colors.tealAccent,
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  hintText: "Enter Your New Password",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
              child: TextField(
                controller: password2C,
                decoration: InputDecoration(
                  hintText: "Repeat Your Password",
                  fillColor: Colors.tealAccent,
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4),
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
              child: TextField(
                controller: emailC,
                decoration: InputDecoration(
                  hintText: "Enter Your New Email",
                  fillColor: Colors.tealAccent,
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4),
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
                  setState(() {
                    if (!userNameC.text.isEmpty)
                      widget.me.username = userNameC.text;
                    if (!passwordC.text.isEmpty) {
                      if (passwordC.text == password2C.text)
                        widget.me.password = passwordC.text;
                      else
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Please Repeat Your Password correctly'),
                          ),
                        );
                    }
                    if (!emailC.text.isEmpty) widget.me.email = emailC.text;
                  });
                },
                child: Text(
                  "Confirm",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
