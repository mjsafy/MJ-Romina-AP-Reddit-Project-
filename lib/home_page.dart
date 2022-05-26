import 'package:flutter/material.dart';
import 'package:reddit/Channel.dart';
import 'package:reddit/User.dart';

import 'Channels.dart';
import 'Create.dart';
import 'Feed.dart';
import 'Settings.dart';

//stateFull widget by scaffold widget and NavigationBar widget
class HomePage extends StatefulWidget {
  static User me;

  HomePage( {Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  List<Widget> pages = [Feed(), Channels(), Create(), Settings()];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text('Reddit', style: TextStyle(color: Colors.grey[800])),
      ),
      body: Center(
        child: pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Channels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_rounded),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[700],
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
