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
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.tealAccent,
              ),
              child: ListTile(
                tileColor: Colors.teal,
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
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: ListTile(
                tileColor: Colors.tealAccent,
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
            ),
            // ListTile for saved posts
            Container(
              decoration: BoxDecoration(
                color: Colors.tealAccent,
              ),
              child: ListTile(
                tileColor: Colors.teal,
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
            ),
          ],
        ));
  }
}
