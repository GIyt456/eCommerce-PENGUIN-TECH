import 'package:flutter/material.dart';

class MonitorPage extends StatelessWidget {
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
              backgroundImage: AssetImage('../assets/images/pngwing.com-removebg-preview.jpg'),
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
              itemCount: monitors.length,
              itemBuilder: (context, index) {
                final monitor = monitors[index];
                return _buildProductCard(
                  title: monitor['title']!,
                  subtitle: monitor['subtitle']!,
                  image: monitor['image']!,
                  price: monitor['price']!,
                  rating: monitor['rating']!,
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
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
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          // Handle bottom navigation bar taps here
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
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
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
final List<Map<String, String>> monitors = [
  {
    'title': 'Acer Predator 27"',
    'subtitle': 'Ultra Fast Gaming Monitor',
    'image': 'assets/images/monitar/acer.jpg',
    'price': 'Rp 12.599.000',
    'rating': '4.8',
  },
  {
    'title': 'Innocn 27" 165Hz',
    'subtitle': 'QHD Gaming Monitor',
    'image': 'assets/images/monitar/innocn.jpg',
    'price': 'Rp 9.500.000',
    'rating': '4.7',
  },
  {
    'title': 'Lenovo Legion R27i',
    'subtitle': '27 inch IPS 165Hz Monitor',
    'image': 'assets/images/monitor3.png',
    'price': 'Rp 11.000.000',
    'rating': '4.9',
  },
  {
    'title': 'Viewsonic Va2432',
    'subtitle': 'Thin Bezel 75Hz Monitor',
    'image': 'assets/images/monitor4.png',
    'price': 'Rp 3.500.000',
    'rating': '4.6',
  },
  {
    'title': 'Samsung Odyssey Ark',
    'subtitle': 'OLED Gaming Monitor',
    'image': 'assets/images/monitor5.png',
    'price': 'Rp 12.995.000',
    'rating': '4.9',
  },
  {
    'title': 'ROG Strix XG346C',
    'subtitle': 'Curved Gaming Monitor',
    'image': 'assets/images/monitor6.png',
    'price': 'Rp 12.999.000',
    'rating': '4.7',
  },
];
