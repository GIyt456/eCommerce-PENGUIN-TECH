import 'package:flutter/material.dart';
import 'welcome/welcome_page.dart';
import 'home_page_1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
      theme: ThemeData(
          primarySwatch: Colors
              .deepPurple), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
