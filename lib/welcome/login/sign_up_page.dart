import 'package:flutter/material.dart';
import 'login_page.dart'; // Import halaman Login
// Pastikan 'HomePage' diimpor jika digunakan
import '../first_page.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Membuat halaman bisa di-scroll
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),

              // Judul Halaman
              Text(
                'Create an account',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),

              // Input Username atau Email
              _buildTextField(
                labelText: 'Username or Email',
                icon: Icons.person,
              ),
              SizedBox(height: 16),

              // Input Password
              _buildTextField(
                labelText: 'Password',
                icon: Icons.lock,
                obscureText: true,
              ),
              SizedBox(height: 16),

              // Input Confirm Password
              _buildTextField(
                labelText: 'Confirm Password',
                icon: Icons.lock,
                obscureText: true,
              ),
              SizedBox(height: 20),

              // Teks Kebijakan
              Text(
                'By clicking the Register button, you agree to the public offer',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              SizedBox(height: 20),

              // Tombol Create Account
              ElevatedButton(
                onPressed: () {
                  // Navigasi ke halaman LoginPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 34, 167, 255),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text(
                  'Create Account',
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                ),
              ),
              SizedBox(height: 20),

              // Teks "OR Continue with"
              Text(
                '- OR Continue with -',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),

              // Tombol Login Sosial Media
              _buildSocialMediaButtons(context),
              SizedBox(height: 20),

              // Teks Sudah Punya Akun (Login)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'I Already Have an Account ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigasi ke halaman Login
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membangun TextField
  Widget _buildTextField({
    required String labelText,
    required IconData icon,
    bool obscureText = false,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        prefixIcon: Icon(icon),
      ),
    );
  }

  // Fungsi untuk membangun tombol sosial media
  Widget _buildSocialMediaButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            // Navigasi ke HomePage (Google login)
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          icon: Image.asset(
            '../assets/images/icongoogle.png', // Path gambar Google
            width: 40, // Ukuran lebar
            height: 40, // Ukuran tinggi
          ),
        ),
        SizedBox(width: 16),
        IconButton(
          onPressed: () {
            // Navigasi ke HomePage (Apple login)
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          icon: Image.asset(
            '../assets/images/iconapple.png', // Path gambar Apple
            width: 40, // Ukuran lebar
            height: 40, // Ukuran tinggi
          ),
        ),
        SizedBox(width: 16),
        IconButton(
          onPressed: () {
            // Navigasi ke HomePage (Facebook login)
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
          icon: Image.asset(
            '../assets/images/iconfacebook.png', // Path gambar Facebook
            width: 40, // Ukuran lebar
            height: 40, // Ukuran tinggi
          ),
        ),
      ],
    );
  }
}
