import 'package:flutter/material.dart';
import 'package:mobile_programming/cart_page.dart';
import 'package:mobile_programming/cart_model.dart';
import 'package:provider/provider.dart';
import 'package:mobile_programming/order_page.dart';

class asusdescription extends StatelessWidget {
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
                      '../assets/images/sparepart/VGAASUS4070.jpeg',
                      fit: BoxFit.contain,
                    ),
                    Image.asset(
                      '../assets/images/sparepart/VGAASUS4070_belakang.jpg',
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Product Title and Details
              Text(
                'ASUS GeForce RTX 4070',
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
                'Rp 18.000.000',
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
                'Boostable to 2670 MHz, 8448 CUDA Cores, Ada Lovelace Architecture, 16GB of GDDR6X VRAM, 21 Gb/s Memory Speed, 256-Bit Memory Interface, HDMI 2.1a - DisplayPort 1.4a, 7680 x 4320 at 60 Hz Max Resolution, PCIe 4.0 x16 Interface, Triple Axial Tech Fans. Based on the Ada Lovelace architecture the ASUS GeForce RTX 4070 Ti SUPER TUF Gaming White OC Graphics Card meets the demands of 4K and 1440p gaming at high frame rates while delivering optimized real-time ray tracing and AI performance. Featuring 16GB of GDDR6X VRAM and a 256-bit memory interface this graphics card offers greater power and efficiency compared to the previous Ampere-based generation. The front panel of the card features a variety of outputs such as DisplayPort 1.4a and HDMI 2.1a. HDMI 2.1a supports up to 48 Gb/s bandwidth and a range of higher resolutions and refresh rates including 8K at 60 Hz and 4K at 240 Hz. The RTX 4070 Ti SUPER is not just about high-resolution gaming. Computationally intensive programs can utilize the GPUs 8448 cores to accelerate tasks using CUDA and other APIs. For cooling ASUS implemented triple Axial Tech fans for up to 21% more airflow. Best Graphic Display Cards',
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
                        title: 'ASUS GeForce RTX 4070',
                        image: '../assets/images/sparepart/VGAASUS4070.jpeg',
                        price:
                            'Rp 18.000.000', // Ensure the correct price is passed
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
                              'title': 'ASUS GeForce RTX 4070',
                              'price': 'Rp 18.000.000',
                              'image':
                                  '../assets/images/sparepart/VGAASUS4070.jpeg',
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
