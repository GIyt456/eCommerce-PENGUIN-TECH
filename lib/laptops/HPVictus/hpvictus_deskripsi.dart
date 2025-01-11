import 'package:flutter/material.dart';
import 'package:mobile_programming/cart_page.dart';
import 'package:mobile_programming/cart_model.dart';
import 'package:provider/provider.dart';
import 'package:mobile_programming/order_page.dart';

class hpdescription extends StatelessWidget {
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
                      '../assets/images/laptop/HPvictus.jpeg',
                      fit: BoxFit.contain,
                    ),
                    Image.asset(
                      '../assets/images/laptop/HPvictus_belakang.jpg',
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Product Title and Details
              Text(
                'HP Victus 15_6 GAMING',
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
                'Rp 15.000.000',
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
                'Laptop : HP VICTUS 15 INTEL I5 12500H RTX4060-8GB 15.6 FHD 144HZ WIN11HOME MICA SILVER SPESIFIKASI : Processor : Intel Core i5-12500H (up to 4.5 GHz with Intel Turbo Boost Technology, 18 MB L3 cache, 12 cores, 16 threads) Display: 15.6′′ diagonal, FHD (1920 x 1080), 144 Hz, IPS, micro-edge, anti-glare, 250 nits, 45% NTSC Memory: 16GB - 32GB DDR4-3200 MHz Storage : 512GB - 1TB PCIe NVMe TLC M.2 SSD Graphics : NVIDIA GeForce RTX 4060 Laptop GPU (8GB GDDR6 dedicated) Keyboard: Full-size, backlit, mica silver keyboard with numeric keypad Wireless: Wi-Fi 6 (2×2) and Bluetooth 5.2 combo (Supporting Gigabit data rate) Color : Mica Silver Ports: 1 SuperSpeed USB Type-C 5Gbps signaling rate (DisplayPort 1.4 HP Sleep and Charge); 1 SuperSpeed USB Type-A 5Gbps signaling rate (HP Sleep and Charge); 1 SuperSpeed USB Type-A 5Gbps signaling rate; 1 HDMI 2.1; 1 RJ-45; 1 AC smart pin; 1 headphone/microphone combo; 1 multi-format SD media card reader KELENGKAPAN : DUS CHARGER UNIT BONUS : TAS BACKPACK HP MOUSE GAMING KEREN MOUSEPAD GAMING KEREN JIKA TAMBAH PAKET ANTIGORES TERDAPAT : Antigores Layar Laptop Pelindung Body Belakang Laptop/laminating Skin Keyboard Cleaning Kits ( Pembersih Laptop ) KENAPA HARUS BELI LAPTOP DI TOKO KAMI: Product yang kami jual di jamin 100% Original Bergaransi pengiriman cepat, semua layanan expedisi TERSEDIA Packing Di jamin aman, Free tambahan Buble wrap secara gratis Berlaku garansi tukar unit, jika Barang saat di terima rusak / Berbeda Unit yg di Order Dengan dasar di wajibkan lampirin Vidio Unboxing',
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
                        title: 'HP Victus 15_6 GAMING',
                        image: '../assets/images/laptop/HPvictus.jpeg',
                        price:
                            'Rp 15.000.000', // Ensure the correct price is passed
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
                              'title': 'HP Victus 15_6 GAMING',
                              'price': 'Rp 15.000.000',
                              'image': '../assets/images/laptop/HPvictus.jpeg',
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
