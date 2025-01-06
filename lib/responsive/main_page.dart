import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'welcome_page_2.dart'; // Import halaman baru Anda

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Penguin Co.',
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => WelcomePage(),
        '/welcome_page_2': (context) => WelcomePage2(),
      },
    );
  }
}
