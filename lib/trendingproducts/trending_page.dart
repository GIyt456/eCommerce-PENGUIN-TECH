import 'package:flutter/material.dart';
import '../spareparts/Keyboardyunzii/yunzi_deskripsi.dart';
import '../laptops/LenovoLegion/lenovolegion_deskripsi.dart';
import '../monitors/SAMSUNG/monitorSamsung_deskripsi.dart';
import '../laptops/AsusTUF/asustuf_deskripsi.dart';
import '../spareparts/ASUSRTX/asusrtx_deskripsi.dart';
import '../spareparts/prosesor intel i9/intel_deskripsi.dart';
import 'package:mobile_programming/home_page_1.dart';
import 'package:mobile_programming/wishlist/wishlist_page.dart';
import 'package:mobile_programming/cart_page.dart';
import 'package:mobile_programming/profile/profile_page.dart';

class TrendingPage extends StatefulWidget {
  @override
  _TrendingpageState createState() => _TrendingpageState();
}

class _TrendingpageState extends State<TrendingPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage1(),
    WishlistPage(),
    CartPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });

    // Navigate to the selected page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => _pages[index]),
    );
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
              // Navigate to Profile Page
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

            // Section Title
            Text(
              "Trending product",
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
              itemCount: trendingproduct.length,
              itemBuilder: (context, index) {
                final monitor = trendingproduct[index];
                return GestureDetector(
                  onTap: () {
                    if (monitor['title'] == 'Keyboard yunzii') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => yunzidescription()),
                      );
                    }
                    if (monitor['title'] == 'Lenovo Legion Pro') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => lenovodescription()),
                      );
                    }
                    if (monitor['title'] == 'Samsung Odyssey Ark') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MSamsungdescription()),
                      );
                    }
                    if (monitor['title'] == 'ASUS TUF Dash F15 FX517ZM-HN001W GAMING') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => asustufdescription()),
                      );
                    }
                    if (monitor['title'] == 'ASUS GeForce RTX 4070') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => asusdescription()),
                      );
                    }
                    if (monitor['title'] == 'Processor intel i9') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => inteldescription()),
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
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF00B0CB), // Blue color for selected item
        unselectedItemColor: Colors.grey, // Grey color for unselected items
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
        onTap: _onItemTapped, // Update selected index on tap
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
      height: 300, // Set a fixed height for the card (adjust as needed)
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with flexible size to avoid overflow and maintain original aspect ratio
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              image,
              fit: BoxFit
                  .contain, // Ensure the image retains its original aspect ratio
              width: double
                  .infinity, // Make sure the image stretches to fit the width of the card
              height:
                  150, // Set a fixed height for the image (adjust as needed)
            ),
          ),
          // Content below the image
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

// Dummy Data for Laptops
final List<Map<String, String>> trendingproduct = [
  {
    'title': 'Keyboard yunzii',
    'subtitle': 'YUNZII YZ87 75% Gasket Mechanical Keyboard',
    'image': '../assets/images/sparepart/keyboardyunzii.jpeg', // Corrected path
    'price': 'Rp 3.999.000',
    'rating': '4.6',
  },
  {
    'title': 'Lenovo Legion Pro',
    'subtitle':
        'Legion Pro i7 Gen 8 2K240 Laptop (i9-13900HX, 4080, 32GB, 1TB)',
    'image': '../assets/images/laptop/lenovolegion.jpeg',
    'price': 'Rp 20.500.000',
    'rating': '4.7',
  },
  {
    'title': 'Samsung Odyssey Ark',
    'subtitle': 'OLED Gaming Monitor',
    'image': '../assets/images/monitar/samsung.jpg',
    'price': 'Rp 12.995.000',
    'rating': '4.9',
  },
  {
    'title': 'ASUS TUF Dash F15 FX517ZM-HN001W GAMING',
    'subtitle':
        'Intel® Core™ i7-12650H, 16GB RAM, 512GB SSD, GeForce RTX™ 3060, W11 H',
    'image': '../assets/images/laptop/TUFGAMING.jpeg',
    'price': 'Rp 18.999.000',
    'rating': '4.8',
  },
  {
    'title': 'ASUS GeForce RTX 4070',
    'subtitle': 'ASUS GeForce RTX 4070 Ti',
    'image': '../assets/images/sparepart/VGAASUS4070.jpeg', // Corrected path
    'price': 'Rp 5.500.000',
    'rating': '4.7',
  },
  {
    'title': 'Processor intel i9',
    'subtitle': 'i9-9900K Intel Core i9',
    'image': '../assets/images/sparepart/i9intel.jpeg', // Corrected path
    'price': 'Rp 3.599.000',
    'rating': '4.8',
  },
];
