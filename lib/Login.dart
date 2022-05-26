import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/User.dart';
import 'package:reddit/home_page.dart';

class Login extends StatefulWidget {
  User user;

  Login({Key key , this.user }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userNameC;
  TextEditingController passwordC;
  @override
  void initState() {
    userNameC = TextEditingController();
    passwordC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userNameC.dispose();
    passwordC.dispose();
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
                      String userName = userNameC.text;
                  String password = passwordC.text;
                  if(widget.user.username == userName && widget.user.password == password){
                    userNameC.clear();
                    passwordC.clear();
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return HomePage();
                    }));

                    }},
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
