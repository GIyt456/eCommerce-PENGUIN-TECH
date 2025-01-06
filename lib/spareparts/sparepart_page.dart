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
              // Add navigation to profile page here
            },
            child: CircleAvatar(
              backgroundImage:
                  AssetImage('../assets/images/pngwing.com-removebg-preview.jpg'),
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

// Dummy Data for Spareparts
final List<Map<String, String>> spareparts = [
  {
    'title': 'Processor intel i9',
    'subtitle': 'i9-9900K Intel Core i9',
    'image': '../assets/images/sparepart/i9intel.jpeg', // Corrected path
    'price': 'Rp 3.599.000',
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
    'title': 'Corsair Vengeance RAM',
    'subtitle': 'Memoria DDR4 32GB 3200MHZ',
    'image': '../assets/images/sparepart/RAMcorsair.jpeg', // Corrected path
    'price': 'Rp 2.500.000',
    'rating': '4.9',
  },
  {
    'title': 'Samsung SSD 1TB',
    'subtitle': 'Ultra Fast NVMe SSD',
    'image': '../assets/images/sparepart/SSDsamsung1TB.jpeg', // Corrected path
    'price': 'Rp 1.999.000',
    'rating': '4.8',
  },
  {
    'title': 'Keyboard yunzii',
    'subtitle': 'YUNZII YZ87 75% Gasket Mechanical Keyboard',
    'image': '../assets/images/sparepart/keyboardyunzii.jpeg', // Corrected path
    'price': 'Rp 3.999.000',
    'rating': '4.6',
  },
  {
    'title': 'Cougar CONQUER ATX Gaming Case',
    'subtitle': 'Cougar CONQUER ATX Gaming Case',
    'image':
        '../assets/images/sparepart/casingCPUcaugar.jpeg', // Corrected path
    'price': 'Rp 1.699.000',
    'rating': '4.7',
  },
];
