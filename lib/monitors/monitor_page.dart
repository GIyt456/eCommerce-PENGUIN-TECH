import 'package:flutter/material.dart';
import 'package:mobile_programming/monitors/ACER/monitorAcer_deskripsi.dart';
import 'package:mobile_programming/monitors/ASUSROG/monitorAsus_deskripsi.dart';
import 'package:mobile_programming/monitors/INNOCN/monitorInnocn_deskripsi.dart';
import 'package:mobile_programming/monitors/LENOVO/monitorLenovo_deskripsi.dart';
import 'package:mobile_programming/monitors/SAMSUNG/monitorSamsung_deskripsi.dart';
import 'package:mobile_programming/monitors/VIEWSONIC/monitorViewsonic_deskripsi.dart';
import 'package:mobile_programming/home_page_1.dart';
import 'package:mobile_programming/profile/profile_page.dart';
import 'package:mobile_programming/cart_page.dart';

class MonitorPage extends StatefulWidget {
  @override
  _MonitorPageState createState() => _MonitorPageState();
}

class _MonitorPageState extends State<MonitorPage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String?>> filteredMonitors = monitors;

  void _searchMonitors(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredMonitors = monitors;
      } else {
        filteredMonitors = monitors.where((monitor) {
          final titleLower = monitor['title']!.toLowerCase();
          final queryLower = query.toLowerCase();
          return titleLower.contains(queryLower);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'PENGUIN CO.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // Tambahkan navigasi ke halaman profil di sini
            },
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  '../assets/images/pngwing.com-removebg-preview.jpg'),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              onChanged: _searchMonitors,
              decoration: InputDecoration(
                hintText: 'Search any Product...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 20),

            // Section Title
            Text(
              "Monitor's",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // Grid of Products
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: filteredMonitors.length,
              itemBuilder: (context, index) {
                final monitor = filteredMonitors[index];
                return GestureDetector(
                  onTap: () {
                    if (monitor['title'] == 'Acer Predator 27"') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MAcerdescription()),
                      );
                    }
                    if (monitor['title'] == 'Innocn 27" 165Hz') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MInnocndescription()),
                      );
                    }
                    if (monitor['title'] == 'Lenovo Legion R27i') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MLenovodescription()),
                      );
                    }
                    if (monitor['title'] == 'Viewsonic Va2432') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MViewsonicdescription()),
                      );
                    }
                    if (monitor['title'] == 'Samsung Odyssey Ark') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MSamsungdescription()),
                      );
                    }
                    if (monitor['title'] == 'ASUS ROG Strix XG346C') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MAsusROGdescription()),
                      );
                    }
                  },
                  child: _buildProductCard(
                    title: monitor['title'] ?? 'Unknown',
                    subtitle: monitor['subtitle'] ?? 'No description',
                    price: monitor['price'] ?? 'Rp 0',
                    image: monitor['image'] ?? 'assets/images/placeholder.png',
                    rating: monitor['rating'] ?? '0.0',
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF00B0CB),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
      ),
    );
  }

  Widget _buildProductCard({
    required String title,
    required String subtitle,
    required String image,
    required String price,
    required String rating,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Text(
                  price,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 14),
                    SizedBox(width: 2),
                    Text(rating),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Dummy Data for Monitors
final List<Map<String, String?>> monitors = [
  {
    'title': 'Acer Predator 27"',
    'subtitle': 'Ultra Fast Gaming Monitor',
    'image': '../assets/images/monitar/acer.jpg',
    'price': 'Rp 12.599.000',
    'rating': '4.8',
  },
  {
    'title': 'Innocn 27" 165Hz',
    'subtitle': 'QHD Gaming Monitor',
    'image': '../assets/images/monitar/innocn.jpg',
    'price': 'Rp 9.500.000',
    'rating': '4.7',
  },
  {
    'title': 'Lenovo Legion R27i',
    'subtitle': '27 inch IPS 165Hz Monitor',
    'image': '../assets/images/monitar/lenovo.jpg',
    'price': 'Rp 2.600.000',
    'rating': '4.9',
  },
  {
    'title': 'Viewsonic Va2432',
    'subtitle': 'Thin Bezel 75Hz Monitor',
    'image': '../assets/images/monitar/viewsonic.jpg',
    'price': 'Rp 1.320.000',
    'rating': '4.6',
  },
  {
    'title': 'Samsung Odyssey Ark',
    'subtitle': 'OLED Gaming Monitor',
    'image': '../assets/images/monitar/samsung.jpg',
    'price': 'Rp 18.000.000',
    'rating': '4.9',
  },
  {
    'title': 'ASUS ROG Strix XG346C',
    'subtitle': 'Curved Gaming Monitor',
    'image': '../assets/images/monitar/Asus.jpg',
    'price': 'Rp 11.000.000',
    'rating': '4.7',
  },
];
