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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFF1C1C1C),
          colorScheme: ColorScheme.dark(),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0XFFFF4500),
          )
      ),
      home: WelcomePage(),

    );
  }
}
