import 'package:flutter/material.dart';
import 'package:reddit/home_page.dart';

import 'Reddit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> onTopPage = [WelcomePage(), HomePage()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xf0a3b18a), useMaterial3: true),

      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
