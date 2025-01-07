import 'package:flutter/material.dart';
// Import halaman deskripsi
import 'Acernitro/acernitro_deskripsi.dart';
import 'LenovoLegion/lenovolegion_deskripsi.dart';
import 'MacBook/macbook_deskripsi.dart';
import 'AsusTUF/asustuf_deskripsi.dart';
import 'HPVictus/hpvictus_deskripsi.dart';
// Import halaman lainnya
import 'package:mobile_programming/home_page_1.dart';
import 'package:mobile_programming/wishlist/wishlist_page.dart';
import 'package:mobile_programming/cart_page.dart';
import 'package:mobile_programming/profile/profile_page.dart';

class LaptopPage extends StatefulWidget {
  @override
  _LaptopPageState createState() => _LaptopPageState();
}

class _LaptopPageState extends State<LaptopPage> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _filteredLaptops = laptops;

  final List<Widget> _pages = [
    HomePage1(),
    WishlistPage(),
    CartPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => _pages[index]),
    );
  }

  void _searchLaptops(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredLaptops = laptops;
      } else {
        _filteredLaptops = laptops
            .where((laptop) =>
                laptop['title']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
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
              onChanged: _searchLaptops,
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
              "Laptop's",
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
              itemCount: _filteredLaptops.length,
              itemBuilder: (context, index) {
                final monitor = _filteredLaptops[index];
                return GestureDetector(
                  onTap: () {
                    if (monitor['title'] == 'Acer Nitro V 15"') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => acerdescription()),
                      );
                    }
                    if (monitor['title'] == 'Lenovo Legion Pro') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => lenovodescription()),
                      );
                    }
                    if (monitor['title'] == 'Two MacBookAir') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => macbookdescription()),
                      );
                    }
                    if (monitor['title'] ==
                        'ASUS TUF Dash F15 FX517ZM-HN001W GAMING') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => asustufdescription()),
                      );
                    }
                    if (monitor['title'] == 'HP Victus 15_6 GAMING') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => hpdescription()),
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
        onTap: _onItemTapped,
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
      height: 300,
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
              fit: BoxFit.contain,
              width: double.infinity,
              height: 150,
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

// Dummy Data for Laptops
final List<Map<String, String>> laptops = [
  {
    'title': 'Acer Nitro V 15"',
    'subtitle': 'Intel Core i5-13420H_16GB_1TB SSD_RTX 3050_15_6_',
    'image': '../assets/images/laptop/acernitrolaptop.jpeg',
    'price': 'Rp 12.599.000',
    'rating': '4.8',
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
    'title': 'Two MacBookAir',
    'subtitle': 'Two MacBookAir M2 Space Gray',
    'image': '../assets/images/laptop/lenovoLOQ.jpeg',
    'price': 'Rp 25.000.000',
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
    'title': 'HP Victus 15_6 GAMING',
    'subtitle': 'HP Victus 15_6 inch FHD IPS 144Hz Gaming Laptop',
    'image': '../assets/images/laptop/HPvictus.jpeg',
    'price': 'Rp 5.500.000',
    'rating': '4.6',
  },
];
