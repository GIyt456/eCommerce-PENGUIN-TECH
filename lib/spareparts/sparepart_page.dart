import 'package:flutter/material.dart';
import 'package:mobile_programming/spareparts/ASUSRTX/asusrtx_deskripsi.dart';
import '../spareparts/corsair vegeance ram/corsair_deskripsi.dart';
import '../spareparts/prosesor intel i9/intel_deskripsi.dart';
import '../spareparts/samsung ssd 1tb/samsung_deskripsi.dart';
import '../spareparts/Keyboardyunzii/yunzi_deskripsi.dart';
import '../spareparts/caseCPU/casecpu_deskripsi.dart';

class SparepartPage extends StatefulWidget {
  @override
  _SparepartPageState createState() => _SparepartPageState();
}

class _SparepartPageState extends State<SparepartPage> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _filteredSpareparts = spareparts;

  void _filterSpareparts(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredSpareparts = spareparts;
      } else {
        _filteredSpareparts = spareparts.where((item) {
          return item['title']!.toLowerCase().contains(query.toLowerCase()) ||
              item['subtitle']!.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      _filterSpareparts(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
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

            // Spareparts Grid
            _filteredSpareparts.isEmpty
                ? Center(child: Text("No products found"))
                : GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: _filteredSpareparts.length,
                    itemBuilder: (context, index) {
                      final product = _filteredSpareparts[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                switch (product['title']) {
                                  case 'ASUS GeForce RTX 4070':
                                    return asusdescription();
                                  case 'Processor intel i9':
                                    return inteldescription();
                                  case 'Corsair Vengeance RAM':
                                    return corsairdescription();
                                  case 'Samsung SSD 1TB':
                                    return samsungdescription();
                                  case 'Keyboard yunzii':
                                    return yunzidescription();
                                  case 'Cougar CONQUER ATX Gaming Case':
                                    return casedescription();
                                  default:
                                    return SizedBox.shrink();
                                }
                              },
                            ),
                          );
                        },
                        child: _buildProductCard(
                          title: product['title'] ?? 'Unknown',
                          subtitle: product['subtitle'] ?? 'No description',
                          price: product['price'] ?? 'Rp 0',
                          image: product['image'] ?? 'assets/images/placeholder.png',
                          rating: product['rating'] ?? '0.0',
                        ),
                      );
                    },
                  ),
          ],
        ),
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

final List<Map<String, String>> spareparts = [
  {
    'title': 'Processor intel i9',
    'subtitle': 'i9-9900K Intel Core i9',
    'image': '../assets/images/sparepart/i9intel.jpeg',
    'price': 'Rp 3.599.000',
    'rating': '4.8',
  },
  {
    'title': 'ASUS GeForce RTX 4070',
    'subtitle': 'ASUS GeForce RTX 4070 Ti',
    'image': '../assets/images/sparepart/VGAASUS4070.jpeg',
    'price': 'Rp 5.500.000',
    'rating': '4.7',
  },
  {
    'title': 'Corsair Vengeance RAM',
    'subtitle': 'Memoria DDR4 32GB 3200MHZ',
    'image': '../assets/images/sparepart/RAMcorsair.jpeg',
    'price': 'Rp 2.500.000',
    'rating': '4.9',
  },
  {
    'title': 'Samsung SSD 1TB',
    'subtitle': 'Ultra Fast NVMe SSD',
    'image': '../assets/images/sparepart/SSDsamsung1TB.jpeg',
    'price': 'Rp 1.999.000',
    'rating': '4.8',
  },
  {
    'title': 'Keyboard yunzii',
    'subtitle': 'YUNZII YZ87 75% Gasket Mechanical Keyboard',
    'image': '../assets/images/sparepart/keyboardyunzii.jpeg',
    'price': 'Rp 3.999.000',
    'rating': '4.6',
  },
  {
    'title': 'Cougar CONQUER ATX Gaming Case',
    'subtitle': 'Cougar CONQUER ATX Gaming Case',
    'image': '../assets/images/sparepart/casingCPUcaugar.jpeg',
    'price': 'Rp 1.699.000',
    'rating': '4.7',
  },
];
