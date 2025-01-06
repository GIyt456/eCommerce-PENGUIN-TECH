import 'package:flutter/material.dart';
import 'home_page_1.dart'; // Import halaman tujuan

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Gambar sebagai Background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    '../assets/images/backgroundgetstart.jpg'), // Path gambar Anda
                fit: BoxFit.cover, // Menyesuaikan gambar dengan layar
              ),
            ),
          ),

          // Konten di Bagian Bawah dengan Gradasi
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Teks Judul
                  Text(
                    'You want Authentic, here you go!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),

                  // Teks Subjudul
                  Text(
                    'Find it here, buy it now!',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24),

                  // Tombol Get Started
                  ElevatedButton(
                    onPressed: () {
                      // Navigasi ke halaman berikutnya
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage1()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 34, 167, 255),
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(0.0), // Atur radius menjadi 0
                      ),
                    ),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
