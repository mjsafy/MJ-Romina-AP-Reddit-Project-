import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reddit/home_page.dart';

import 'User.dart';

class Create extends StatefulWidget {
  Create({ Key key}) : super(key: key);

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  TextEditingController titleC;

  TextEditingController descC;

  @override
  void initState() {
    titleC = TextEditingController();
    descC = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleC.dispose();
    descC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
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
                controller: titleC,
                decoration: const InputDecoration(
                  fillColor: Colors.tealAccent,
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  hintText: "Title",
                )),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: TextField(
                minLines: 3,
                maxLines: 5,
                controller: descC,
                decoration: const InputDecoration(
                  fillColor: Colors.tealAccent,
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(40))),
                  hintText: "Description",
                )),
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
                    if(titleC.text.isEmpty)
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                          Text('Enter Title'),
                        ),
                      );
                    else{
                      () async {
                        await Socket.connect("10.0.2.2", 555).then(
                              (ss) {
                            ss.write("addPost-"+titleC.text+"-"+descC.text);
                            ss.flush();
                            ss.listen((response) {
                              print( String.fromCharCodes(response));
                            });
                          },
                        );
                      };
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Post Created Successfully'),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Create",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )))
        ],
      ),
    );
  }
}
