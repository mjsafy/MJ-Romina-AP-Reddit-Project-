import 'package:flutter/material.dart';
import 'package:reddit/User.dart';

class Settings extends StatefulWidget {


  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              children: [Text("")],
            ),
          )
        ],
      ),
    );
  }
}
