import 'package:flutter/material.dart';
import 'package:mobile_programming/cart_page.dart';
import 'package:mobile_programming/cart_model.dart';
import 'package:provider/provider.dart';
import 'package:mobile_programming/order_page.dart';

class corsairdescription extends StatelessWidget {
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
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image and Carousel
              AspectRatio(
                aspectRatio: 16 / 9,
                child: PageView(
                  children: [
                    Image.asset(
                      '../assets/images/sparepart/RAMcorsair.jpeg',
                      fit: BoxFit.contain,
                    ),
                    Image.asset(
                      '../assets/images/sparepart/RAMcorsair.jpeg',
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Product Title and Details
              Text(
                'Corsair Vengeance RAM 32GB',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 16),
                  SizedBox(width: 5),
                  Text('4.8 (56,690 reviews)'),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Rp 1.500.000',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 20),

              // Product Description
              Text(
                'Product Details',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Fan Included No Memory Series VENGEANCE RGB PRO Memory Type DDR4 Memory Size 32GB Kit (2 x 16GB) Tested Latency 18-22-22-42 Tested Voltage 1.35V Tested Speed 4000MHz Memory Color BLACK LED Lighting RGB Single Zone / Multi-Zone Lighting Individually Addressable SPD Latency 18-18-18-43 SPD Speed 2666MHz SPD Voltage 1.2V Speed Rating PC4-32000 (4000MHz) Compatibility Intel Z390,AMD 400 Series,AMD 500 Series,AMD X570 Heat Spreader Anodized Aluminum Package Memory Format DIMM Performance Profile XMP 2.0 Package Memory Pin 288 Note : + Cek stock terlebih dahulu sebelum order (Ketersedian Terbatas) + Gambar hanya ilustrasi, versi produk dapat berbeda tergantung kebijakan vendor, namun tidak mengurangi spesifikasi dan fungsi produk + Request warna, ukuran dll. Wajib cantumkan pada keterangan saat order, Jika tidak maka unit kami kirim secara random + Simpan dus dan invoice pembelian untuk klaim garansi NoBrand',
              ),
              SizedBox(height: 20),

              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Create a CartItem object to add to the cart with the correct price
                      final cartItem = CartItem(
                        title: 'Corsair Vengeance RAM 32GB',
                        image: '../assets/images/sparepart/RAMcorsair.jpeg',
                        price:
                            'Rp 1.500.000', // Ensure the correct price is passed
                        rating: 4.8,
                      );

                      // Add item to cart
                      Provider.of<CartProvider>(context, listen: false)
                          .addToCart(cartItem);

                      // Navigate to Cart Page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    },
                    icon: Icon(Icons.shopping_cart, color: Colors.white),
                    label: Text(
                      'Go to Cart',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Navigate to Order Page with product details
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderPage(
                            product: {
                              'title': 'Corsair Vengeance RAM 32GB',
                              'price': 'Rp 1.500.000',
                              'image':
                                  '../assets/images/sparepart/RAMcorsair.jpeg',
                            },
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.shopping_bag, color: Colors.white),
                    label: Text(
                      'Buy Now',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSizeOption(String size, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color),
      ),
      child: Text(
        size,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
