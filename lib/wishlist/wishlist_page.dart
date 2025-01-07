import 'package:flutter/material.dart';
import 'package:mobile_programming/monitors/ASUSROG/monitorAsus_deskripsi.dart';
import 'package:mobile_programming/monitors/SAMSUNG/monitorSamsung_deskripsi.dart';
import 'package:mobile_programming/spareparts/corsair vegeance ram/corsair_deskripsi.dart';
import '../home_page_1.dart'; // Import halaman HomePage1
import '../profile/profile_page.dart'; // Import halaman ProfilePage
import '../cart_page.dart'; // Import halaman CartPage
import '../shop_page.dart'; // Import halaman ShopPage
import '../monitors/ACER/monitorAcer_deskripsi.dart';


class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String?>> filteredproducts= products;

  void _searchMonitors(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredproducts= products;
      } else {
        filteredproducts= products.where((monitor) {
          final titleLower = monitor['title']!.toLowerCase();
          final queryLower = query.toLowerCase();
          return titleLower.contains(queryLower);
        }).toList();
      }
    });
  }

  int _selectedIndex = 1; // Index tab 'Wishlist'

  void _onItemTapped(int index) {
    if (index == _selectedIndex)
      return; // Jika sudah di halaman yang sama, tidak perlu navigasi ulang

    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage1()),
        );
        break;
      case 1:
        // Tetap di halaman Wishlist
        break;
      case 2:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => CartPage()),
        );
        break;
      case 3:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
        break;
    }
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
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: CircleAvatar(
              backgroundImage: AssetImage(
                  '../assets/images/pngwing.com-removebg-preview.jpg'),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
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
              "Wishlist Product's",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),

            // Product Grid
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: filteredproducts.length,
              itemBuilder: (context, index) {
                final monitor = filteredproducts[index];
                return GestureDetector(
                  onTap: () {
                    if (monitor['title'] == 'Acer Predator 27"') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MAcerdescription()),
                      );
                    }
                    if (monitor['title'] == 'Asus ROG Strix G15') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MAsusROGdescription()),
                      );
                    }
                    if (monitor['title'] == 'Samsung Odyssey Ark') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MSamsungdescription()),
                      );
                    }
                    if (monitor['title'] == 'Corsair') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => corsairdescription()),
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
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF00B0CB), // Blue color for selected item
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
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
      ),
    );
  }

  Widget _buildProductCard({
    required String title,
    required String price,
    required String image,
    required String rating,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: 120,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
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

final List<Map<String, String?>> products = [
  {
    'title': 'Acer Predator Z27',
    'price': 'Rp 12.999.000',
    'image': '../assets/images/monitar/acer.jpg',
    'rating': '4.5',
  },
  {
    'title': 'Asus ROG Strix G15',
    'price': 'Rp 15.999.000',
    'image': '../assets/images/monitar/Asus.jpg',
    'rating': '5.0',
  },
  {
    'title': 'Samsung Odyssey Ark',
    'price': 'Rp 12.999.000',
    'image': '../assets/images/monitar/samsung.jpg',
    'rating': '4.8',
  },
  {
    'title': 'Corsair',
    'price': 'Rp 3.499.000',
    'image': '../assets/images/sparepart/RAMcorsair.jpeg',
    'rating': '4.7',
  },
];
