import 'package:flutter/material.dart';

class LaptopPage extends StatelessWidget {
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
              itemCount: laptops.length,
              itemBuilder: (context, index) {
                final laptop = laptops[index];
                return _buildProductCard(
                  title: laptop['title']!,
                  subtitle: laptop['subtitle']!,
                  image: laptop['image']!,
                  price: laptop['price']!,
                  rating: laptop['rating']!,
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

// Dummy Data for Laptops
final List<Map<String, String>> laptops = [
  {
    'title': 'Acer Predator 27"',
    'subtitle': 'Ultra Fast Gaming Monitor',
    'image': 'assets/images/laptop1.png',
    'price': 'Rp 12.599.000',
    'rating': '4.8',
  },
  {
    'title': 'Lenovo Legion Pro',
    'subtitle': 'Gaming Laptop with RTX 3060',
    'image': 'assets/images/laptop2.png',
    'price': 'Rp 7.500.000',
    'rating': '4.7',
  },
  {
    'title': 'Corsair Vengeance DDR4',
    'subtitle': 'i9 64GB 3200MHz RAM',
    'image': 'assets/images/laptop3.png',
    'price': 'Rp 15.000.000',
    'rating': '4.9',
  },
  {
    'title': 'Asus ROG Strix G15',
    'subtitle': 'Gaming Laptop with RTX 4090',
    'image': 'assets/images/laptop4.png',
    'price': 'Rp 16.999.000',
    'rating': '4.8',
  },
  {
    'title': 'Lenovo LOQ',
    'subtitle': 'i5 16GB, 1TB SSD',
    'image': 'assets/images/laptop5.png',
    'price': 'Rp 5.500.000',
    'rating': '4.6',
  },
  {
    'title': 'Acer Nitro V15',
    'subtitle': 'Budget Gaming Laptop with RTX 3050',
    'image': 'assets/images/laptop6.png',
    'price': 'Rp 6.999.000',
    'rating': '4.7',
  },
  {
    'title': 'Asus TUF F15',
    'subtitle': 'Core i5 12th Gen, GTX 1660 Ti',
    'image': 'assets/images/laptop7.png',
    'price': 'Rp 13.500.000',
    'rating': '4.5',
  },
];
