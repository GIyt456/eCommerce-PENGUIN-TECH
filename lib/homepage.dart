import 'package:flutter/material.dart';
import 'package:mobile_programming/responsive/desktop_body.dart';
import 'package:mobile_programming/responsive/welcome_page.dart';
import 'package:mobile_programming/responsive/responsive_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: responsiveLayout(
        mobileBody: WelcomePage(),
        desktopBody: MyDesktopBody(),
      ),
    );
  }
}