import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavedPosts extends StatefulWidget {
  const SavedPosts({Key key}) : super(key: key);

  @override
  State<SavedPosts> createState() => _SavedPostsState();
}

class _SavedPostsState extends State<SavedPosts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Saved Posts') , centerTitle: true,),
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
      ),
    );
  }
}
