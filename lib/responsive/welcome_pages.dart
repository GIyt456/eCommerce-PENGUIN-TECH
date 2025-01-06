import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'welcome_page_2.dart';

class WelcomePages extends StatelessWidget {
  const WelcomePages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          WelcomePage(),     // Halaman pertama
          WelcomePage2(),    // Halaman kedua
        ],
      ),
    );
  }
}
