import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reddit/User.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

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
    User user = User(
        username: "mjsafy",
        password: "mjavads",
        name: "mj",
        email: "mj@gmail.com",
        id: "52");
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
              child: Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: w / 5, vertical: 20),
                    child: Text("Name"),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(user.name),
                  ),
                ],
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
              child: Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: w / 5, vertical: 20),
                    child: Text("Email"),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(user.email),
                  ),
                ],
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
              child: Row(
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: w / 5, vertical: 20),
                    child: Text("Id    "),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(user.id),
                  ),
                ],
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
              child: TextField(
                controller: userNameC,
                decoration: InputDecoration(
                    hintText: "Enter Your New UserName",
                    contentPadding: EdgeInsets.symmetric(horizontal: 20)),
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
              child: TextField(
                controller: passwordC,
                decoration: InputDecoration(
                    hintText: "Enter Your New Password",
                    contentPadding: EdgeInsets.symmetric(horizontal: 20)),
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
              child: TextField(
                controller: password2C,
                decoration: InputDecoration(
                    hintText: "Repeat Your Password",
                    contentPadding: EdgeInsets.symmetric(horizontal: 20)),
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
              child: TextField(
                controller: emailC,
                decoration: InputDecoration(
                    hintText: "Enter Your New Email",
                    contentPadding: EdgeInsets.symmetric(horizontal: 20)),
              ),
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    if (!userNameC.text.isEmpty) user.username = userNameC.text;
                    if (!passwordC.text.isEmpty) {
                      if (passwordC.text == password2C.text)
                        user.password = passwordC.text;
                      else
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Please Repeat Your Password correctly'),
                          ),
                        );
                    }
                    if (!emailC.text.isEmpty) user.email = emailC.text;
                  });
                },
              child: Text("Confirm"),),
            ),
          ],
        ),
      ),
    );
  }
}
