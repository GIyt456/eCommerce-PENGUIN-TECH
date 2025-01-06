import 'package:flutter/material.dart';
import 'cart_page.dart'; // Import halaman CartPage
import 'profile_page.dart'; // Import halaman ProfilePage
import 'monitors/monitor_page.dart'; // Import halaman MonitorPage
import 'laptops/laptop_page.dart'; // Import halaman LaptopPage
import 'spareparts/sparepart_page.dart'; // Import halaman SparepartPage
import 'wishlist_page.dart'; // Import halaman WishlistPage
import 'trendingproducts/trending_page.dart'; // Import halaman TrendingPage

class HomePage1 extends StatelessWidget {
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
              Navigator.push(
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
      body: SingleChildScrollView(
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

            // Section: All Featured
            Text(
              'All Featured',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryItem(
                    context,
                    title: 'Monitor',
                    imagePath: '../assets/images/monitorhomee.jpeg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MonitorPage()),
                      );
                    },
                  ),
                  _buildCategoryItem(
                    context,
                    title: 'Sparepart',
                    imagePath:
                        '../assets/images/sparepart/9f492656-553d-4d0e-8a80-27f7155f52ba.jpeg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SparepartPage()),
                      );
                    },
                  ),
                  _buildCategoryItem(
                    context,
                    title: 'Laptop',
                    imagePath: '../assets/images/laptop/MACbook.jpeg',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LaptopPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Banner Image
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      '../assets/images/iklan.jpg',
                      fit: BoxFit.cover,
                      width: 450,
                      height: 200,
                    ),
                  ),
                  SizedBox(width: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      '../assets/images/iklanA2.jpg',
                      fit: BoxFit.cover,
                      width: 450,
                      height: 200,
                    ),
                  ),
                  SizedBox(width: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      '../assets/images/iklanA3.jpg',
                      fit: BoxFit.cover,
                      width: 450,
                      height: 200,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Section: Trending Products
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color(0xFF00B0CB), // Background color
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trending Products',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // Text color
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Colors.white,
                            size: 16,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            'Last Date 29/02/22',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white, // Text color
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TrendingPage()),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor:
                          Color(0xFF00B0CB), // Inner blue background
                      side: BorderSide(
                          color: Colors.white, width: 2.0), // White border
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white, // Icon color
                      size: 16,
                    ),
                    label: Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white, // Text color
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildProductCard(
                    title: 'Rp 15.000.000',
                    image: '../assets/images/sparepart/VGAASUS4070.jpeg',
                    rating: '4.0',
                    sold: '56,000',
                  ),
                  _buildProductCard(
                    title: 'Rp 15.000.000',
                    image: '../assets/images/laptop/TUFGAMING.jpeg',
                    rating: '4.0',
                    sold: '56,000',
                  ),
                  _buildProductCard(
                    title: 'Rp 15.000.000',
                    image: '../assets/images/sparepart/keyboardyunzii.jpeg',
                    rating: '4.0',
                    sold: '56,000',
                  ),
                  SizedBox(width: 40),
                  _buildProductCard(
                    title: 'Rp 15.000.000',
                    image: '../assets/images/sparepart/prosesorAMDryzen9.jpeg',
                    rating: '4.0',
                    sold: '56,000',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Footer Images
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                Image.asset('../assets/images/iklanB1.jpeg', fit: BoxFit.cover),
                Image.asset('../assets/images/iklanB2.jpg', fit: BoxFit.cover),
                Image.asset('../assets/images/iklanB3.jpg', fit: BoxFit.cover),
                Image.asset('../assets/images/iklanB4.jpeg', fit: BoxFit.cover),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor:
            Color(0xFF00B0CB), // Warna biru untuk ikon dan teks yang terpilih
        unselectedItemColor:
            Colors.grey, // Warna ikon dan teks yang tidak terpilih
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WishlistPage()),
                );
              },
              child: Icon(Icons.favorite),
            ),
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

  Widget _buildCategoryItem(
    BuildContext context, {
    required String title,
    required String imagePath,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 10),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(imagePath),
            ),
            SizedBox(height: 5),
            Text(title),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard({
    required String title,
    required String image,
    required String rating,
    required String sold,
  }) {
    return Container(
      width: 150,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.orange, size: 14),
              SizedBox(width: 2),
              Text('$rating ($sold Sold)'),
            ],
          ),
        ],
      ),
    );
  }
}
