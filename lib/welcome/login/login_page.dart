import 'package:flutter/material.dart';
import 'sign_up_page.dart'; // Import halaman Sign Up
import 'forgot_password_page.dart'; // Import halaman Forgot Password
import '../first_page.dart'; // Import halaman Home

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Judul Halaman
            Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),

            // Input Username atau Email
            TextField(
              decoration: InputDecoration(
                labelText: 'Username or Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Input Password
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                suffixIcon: Icon(Icons.visibility),
              ),
            ),
            SizedBox(height: 8),

            // Teks Lupa Password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordPage(),
                    ),
                  );
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Tombol Login
            ElevatedButton(
              onPressed: () {
                // Navigasi ke HomePage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
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
                'Login',
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

            // Tombol Login Sosial Media dengan ukuran gambar yang sama
            Row(
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
            ),
            SizedBox(height: 20),

            // Teks Buat Akun
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Create An Account ',
                  style: TextStyle(color: Colors.grey),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.blue),
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
