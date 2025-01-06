import 'package:flutter/material.dart';
import 'package:mobile_programming/welcome/welcome_page_2.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    // Berpindah ke halaman utama setelah 3 detik
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage2()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          children: [
            // Gambar Latar
            Positioned.fill(
              child: Image.asset(
                '../assets/images/20241212_103231.jpg', //stikan gambar ada di folder assets
                fit: BoxFit.cover,
              ),
            ),
            // Teks Branding
            Align(
              alignment: Alignment.center,
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
