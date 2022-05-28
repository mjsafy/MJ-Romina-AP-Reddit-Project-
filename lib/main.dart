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
          buttonTheme: ButtonThemeData(
            buttonColor: Color(0XFFFF4500),
            textTheme: ButtonTextTheme.primary,
          ),
          scaffoldBackgroundColor: Color(0xFFFFFFFF),
          colorScheme: ColorScheme.light(),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0XFFFF4500),
          )
      ),
      home: WelcomePage(),

    );
  }
}
