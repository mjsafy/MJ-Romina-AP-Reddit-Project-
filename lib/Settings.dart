import 'package:flutter/material.dart';
import 'package:reddit/User.dart';

import 'Profile.dart';

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
        ListTile(
          title: Text(
            "Profile",
            style: TextStyle(
              fontSize: 23,
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return Profile();
            }));
          },
        ),
      ],
    ));
  }
}
