import 'package:flutter/material.dart';

class TrendingPage extends StatelessWidget {
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
                final Trenproduct = trendingproduct[index];
                return _buildProductCard(
                  title: Trenproduct['title']!,
                  subtitle: Trenproduct['subtitle']!,
                  image: Trenproduct['image']!,
                  price: Trenproduct['price']!,
                  rating: Trenproduct['rating']!,
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
    'title': 'AMD RYZEN 9',
    'subtitle': 'AMD Ryzen 9 5900X 3_7 GHz 12-Core_24-Thread Processor',
    'image': '../assets/images/sparepart/prosesorAMDryzen9.jpeg', // Corrected path
    'price': 'Rp 5.500.000',
    'rating': '4.7',
  },
];
