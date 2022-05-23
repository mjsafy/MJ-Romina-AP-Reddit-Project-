import 'package:flutter/material.dart';

import 'SignUp.dart';

class Reddit extends StatelessWidget {
  const Reddit({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Reddit",
            style: TextStyle(fontSize: 25),
          )),
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
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: h / 30),
                  width: w / 2,
                  height: h / 10,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.deepPurple,
                            Colors.deepOrange,
                          ])),
                  child: TextButton(
                      autofocus: true,
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),onPressed:() {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return SignUp();
                    }));
                  },
                    )),
              Container(

                  width: w / 2,
                  height: h / 10,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.deepOrange,
                            Colors.deepPurple,
                          ])),
                  child: TextButton(
                      autofocus: true,
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
