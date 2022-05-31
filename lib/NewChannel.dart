import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewChannel extends StatelessWidget {
  NewChannel({Key key}) : super(key: key);
  TextEditingController nameC;

  @override
  initstate() {
    nameC = TextEditingController();
  }

  @override
  dispose() {
    nameC.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('New Channel'),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(padding: EdgeInsets.symmetric(vertical: 4),

                child: TextField(
                  decoration: const InputDecoration(
                      fillColor: Colors.tealAccent,
                      filled: true,
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      hintText: "Enter Channel Name",
                  )
                ),
              ),
              Container(
                width: w / 2.5,
                height: h / 12.5,
                padding: EdgeInsets.symmetric(vertical: 4),
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
                  child: Text(
                    'Create',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () {
                    if (nameC.text.isNotEmpty) {
                      String name = nameC.text;
                      Navigator.pop(context, name);
                      nameC.clear();
                    }
                  },
                ),
              )
            ],
          ),
        ));
  }
}
