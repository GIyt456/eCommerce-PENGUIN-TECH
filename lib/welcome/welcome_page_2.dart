import 'package:flutter/material.dart';
import 'welcome_page.dart';
import 'welcome_page_3.dart';
import 'login/login_page.dart'; // Import halaman LoginPage

class WelcomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Indikator halaman onboarding (2/3)
            Align(
              alignment: Alignment.topLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '1/3',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigasi ke LoginPage saat tombol Skip ditekan
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Text('Skip', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),

            // Gambar dengan sudut melengkung
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(20), // Radius untuk sudut melengkung
              child: Image.asset(
                '../assets/images/skip1.jpg', // Ganti dengan path gambar Anda
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 40),

            // Judul
            Text(
              'Choose Your Products',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 12),

            // Deskripsi
            Text(
              'Save your favorite products to easily find them later.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            Spacer(),

            // Indikator halaman
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(radius: 4, backgroundColor: Colors.blue),
                SizedBox(width: 8),
                CircleAvatar(radius: 4, backgroundColor: Colors.grey[300]),
                SizedBox(width: 8),
                CircleAvatar(radius: 4, backgroundColor: Colors.grey[300]),
              ],
            ),

            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Navigasi ke halaman sebelumnya
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomePage()),
                    );
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Navigasi ke halaman berikutnya
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomePage3()),
                    );
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
