import 'package:flutter/material.dart';

class SparepartPage extends StatelessWidget {
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
              backgroundImage: AssetImage('assets/images/profile_picture.png'),
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
              "Spareparts",
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
              itemCount: spareparts.length,
              itemBuilder: (context, index) {
                final sparepart = spareparts[index];
                return _buildProductCard(
                  title: sparepart['title']!,
                  subtitle: sparepart['subtitle']!,
                  image: sparepart['image']!,
                  price: sparepart['price']!,
                  rating: sparepart['rating']!,
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

// Dummy Data for Spareparts
final List<Map<String, String>> spareparts = [
  {
    'title': 'Processor i7',
    'subtitle': '11th Gen Intel Processor',
    'image': 'assets/images/sparepart1.png',
    'price': 'Rp 3.599.000',
    'rating': '4.8',
  },
  {
    'title': 'GTX 1660',
    'subtitle': 'NVIDIA Graphics Card',
    'image': 'assets/images/sparepart2.png',
    'price': 'Rp 5.500.000',
    'rating': '4.7',
  },
  {
    'title': 'Corsair Vengeance RAM',
    'subtitle': '16GB DDR4',
    'image': 'assets/images/sparepart3.png',
    'price': 'Rp 2.500.000',
    'rating': '4.9',
  },
  {
    'title': 'Samsung SSD 1TB',
    'subtitle': 'Ultra Fast NVMe SSD',
    'image': 'assets/images/sparepart4.png',
    'price': 'Rp 1.999.000',
    'rating': '4.8',
  },
  {
    'title': 'Motherboard ASUS',
    'subtitle': 'Supports Ryzen 9',
    'image': 'assets/images/sparepart5.png',
    'price': 'Rp 3.999.000',
    'rating': '4.6',
  },
  {
    'title': 'Power Supply 750W',
    'subtitle': '80 Plus Gold Certified',
    'image': 'assets/images/sparepart6.png',
    'price': 'Rp 1.699.000',
    'rating': '4.7',
  },
];
