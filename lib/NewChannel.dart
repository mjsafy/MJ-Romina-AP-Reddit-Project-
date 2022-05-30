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
    return Scaffold(
        appBar: AppBar(
          title: Text('New Channel'),
        ),
        body: Container(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Channel Name',
                ),
              ),
              TextButton(
                child: Text('Create'),
                onPressed: () {
                  if (nameC.text.isNotEmpty) {
                    String name = nameC.text;
                    Navigator.pop(context, name);
                    nameC.clear();
                  }
                },
              )
            ],
          ),
        ));
  }
}
