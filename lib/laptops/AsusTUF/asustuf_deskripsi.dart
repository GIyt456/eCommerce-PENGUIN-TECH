import 'package:flutter/material.dart';
import 'package:mobile_programming/cart_page.dart';
import 'package:mobile_programming/cart_model.dart';
import 'package:provider/provider.dart';
import 'package:mobile_programming/order_page.dart';

class asustufdescription extends StatelessWidget {
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
                      '../assets/images/laptop/TUFGAMING.jpeg',
                      fit: BoxFit.contain,
                    ),
                    Image.asset(
                      '../assets/images/laptop/TUFGAMING_belakang.jpg',
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Product Title and Details
              Text(
                'ASUS TUF Dash F15 FX517ZM-HN001W GAMING',
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
                'Rp 19.000.000',
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
                'ASUS TUF DASH F15, Brand New Design Clean lines define the look and feel of the new 2022 TUF Dash F15. A mecha-inspired aluminum top cover is available in Off Black or Moonlight White. This modern design is at home, at LAN parties and offices alike, closing down to a streamlined 19.95mm thin for portability between both. Super-narrow bezels continue the theme, maximizing screen space with minimal distraction. The dashing looks don’t compromise a classic TUF core that meets military-grade MIL-STD standards. The Ultimate Play Cutting-edge GPUs offer reliable frame rates for popular games. This machine features a GeForce RTX 3070 Laptop GPU. Built on the NVIDIA Ampere architecture, these GPUs combine new streaming multiprocessors with enhanced RT Cores and Tensor Cores to enable the most realistic ray-traced graphics and advanced AI features. Experience dependably smooth performance for esports, AAA games, and everything in between. Ready For Anything Comprehensive cooling sustains long-term system reliability and extends the lifespan of the TUF Dash F15. New 84-blade Arc Flow Fans use varying thickness to reduce air collision and an anti-resonance design designed for high airflow. Anti-dust tunnels eject air from up to four fan outlets, maintaining peak operation for longer—and without extra fan noise, allowing you to fully immerse yourself in another world. Enduring Power Game, stream, and code anywhere. Ultrafast Thunderbolt 4 lets you connect conveniently on the fly to the latest devices, like powerful external GPUs or docking stations. Type-C charging lets you top off your battery from portable power packs, so you can stop scrambling for a socket when your battery gets low. Unplug and unwind with a 76Wh battery, and fast charging that gets you to 50% in only 30 minutes. Precision Strikes The keyboard’s desktop-style layout features spaces between function keys for intuitive identification and hot keys to keep vital commands within easy reach. A travel distance of 1.7mm allows for effortless keystrokes with the potential to increase your input speed.',
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
                        title: 'ASUS TUF Dash F15 FX517ZM-HN001W GAMING',
                        image: '../assets/images/laptop/TUFGAMING.jpeg',
                        price:
                            'Rp 19.000.000', // Ensure the correct price is passed
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
                              'title': 'ASUS TUF Dash F15 FX517ZM-HN001W GAMING',
                              'price': 'Rp 19.000.000',
                              'image':
                                  '../assets/images/laptop/TUFGAMING.jpeg',
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
