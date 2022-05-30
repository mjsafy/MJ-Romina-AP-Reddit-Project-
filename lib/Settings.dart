import 'package:flutter/material.dart';
import 'package:reddit/User.dart';

import 'NewChannel.dart';
import 'Profile.dart';
import 'SavedPosts.dart';

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
        ListTile(
          title: Text(
            "New Channel",
            style: TextStyle(
              fontSize: 23,
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return NewChannel();
            }));
          },
        ),
        // ListTile for saved posts
        ListTile(
          title: Text(
            "Saved Posts",
            style: TextStyle(
              fontSize: 23,
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return SavedPosts();
            }));
          },
        ),
      ],
    ));
  }
}
