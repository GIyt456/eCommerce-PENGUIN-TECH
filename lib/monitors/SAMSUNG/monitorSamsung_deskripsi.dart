import 'package:flutter/material.dart';
import 'package:mobile_programming/cart_page.dart';
import 'package:mobile_programming/cart_model.dart';
import 'package:provider/provider.dart';
import 'package:mobile_programming/order_page.dart';

class MSamsungdescription extends StatelessWidget {
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
                    Image.asset('../assets/images/monitar/samsung.jpg',
                        fit: BoxFit.contain,),
                    Image.asset('../assets/images/monitar/samsung_belakang.jpg',
                        fit: BoxFit.contain,),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Product Title and Details
              Text(
                'Samsung Odyssey Ark',
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
                'SAMSUNG Smart Gaming Monitor 55” Odyssey Ark G97NC UHD 165Hz Mini LED LS55CG970NEXXD Spesifikasi Display Screen Size (Class): 55 Flat / Curved: Curved Active Display Size (HxV) (mm): 1209.6(H) x 680.4(V) Screen Curvature: 1000R Aspect Ratio: 16:9 Panel Type: VA Brightness (Typical): 600 cd/m2 Brightness (Min): 420 cd/m2 Contrast Ratio Static: 1,000,000:1 (Static) Contrast Ratio (Dynamic): Mega DCR HDR(High Dynamic Range): Quantum HDR 32x HDR10+: HDR10+ Gaming Mini LED Local Dimming: Yes (1,056 zones) Resolution: 3,840 x 2,160 Response Time: 1ms(GTG) Viewing Angle (H/V): 178°(H)/178°(V) Color Support: Max 1B Color Gamut (DCI Coverage): 95%(Typ.) Refresh Rate: Max 165Hz Design Front Color: BLACK Rear Color: BLACK Stand Color: BLACK Stand Type: HAS PIVOT HAS(Height Adjustable Stand): Landscape : 0~270mm(±5mm), Portrait : 0~30mm(±5mm) Tilt: Landscape : -10 ̊(±2 ̊)~10 ̊(±2 ̊), Portrait : -13 ̊(±2 ̊)~10 ̊(±2 ̊) Pivot: -90 ̊(±2 ̊)~90 ̊(±2 ̊) Wall Mount: 200 x 200 Dimension Set Dimension with Stand (WxHxD): 1174.8 x 1102.0 x 379.0 mm Set Dimension without Stand (WxHxD): 1174.8 x 704.8 x 251.8 mm Package Dimension (WxHxD): 1362.0 x 922.0 x 317.0 mm Weight Set Weight with Stand: 41.5 kg Set Weight without Stand: 21.1 kg Package Weight: 57.1 kg Accessory Power Cable Length: 1.5 m HDMI Cable: Yes Remote Controller: Yes',
              ),
              SizedBox(height: 20),

              // Action Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Create a CartItem object to add to the cart
                      final cartItem = CartItem(
                        title: 'Samsung Odyssey Ark',
                        image: '../assets/images/monitar/samsung.jpg',
                        price: 'Rp 18.000.000',
                        rating: 4.8, // Add rating here
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
                    icon: Icon(Icons.shopping_cart),
                    label: Text('Go to Cart'),
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
                              'title': 'Samsung Odyssey Ark',
                              'price': 'Rp 18.000.000',
                              'image': '../assets/images/monitar/samsung.jpg',
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
