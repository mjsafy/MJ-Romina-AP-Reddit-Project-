import 'package:flutter/material.dart';
class Create extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  @override
  Widget build(BuildContext context) {
    return Text (
      'Create',
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}