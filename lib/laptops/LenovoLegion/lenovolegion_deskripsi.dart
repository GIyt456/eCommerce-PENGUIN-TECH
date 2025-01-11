import 'package:flutter/material.dart';
import 'package:mobile_programming/cart_page.dart';
import 'package:mobile_programming/cart_model.dart';
import 'package:provider/provider.dart';
import 'package:mobile_programming/order_page.dart';

class lenovodescription extends StatelessWidget {
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
                      '../assets/images/laptop/lenovolegion.jpeg',
                      fit: BoxFit.contain,
                    ),
                    Image.asset(
                      '../assets/images/laptop/lenovolegion_belakang.jpeg',
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Product Title and Details
              Text(
                'Lenovo Legion Pro',
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
                'Rp 20.000.000',
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
                'LENOVO LEGION 5I PRO 16 INTEL I7 12700H 16GB DDR5 1TB SSD RTX3050TI-4GB 16.0 WQXGA 165HZ 4ZRGB WIN11 HOME GREY EX DISPLAY - GARANSI 3 BULAN FREE : ️ Buble Wrap ( kecuali Instant Kurir ) ️ Mouse Keren ️ Tas LENOVO SPESIFIKASI PRODUK ️ Processor : Intel Core i7-12700H Cache 24 M, hingga 4,70 GHz ️ Display : 16" WQXGA 165HZ 4ZRGB ️ RAM : 16 GB DDR5 ️ STORAGE : SSD 1 TB NVME ️ Tipe Grafis : NVIDIA RTX3050TI-4GB ️ Sistem Operasi : WINDOW 11 HOME GARANSI EX DISPLAY Kondisi : ️ Berkualitas, Mesin 100% bekerja tanpa kendala. ️ Kondisi Fisik 90% - 95% Bekas display, Mulus untuk kondisi ex display ️ Bergaransi 3 Bulan, Tukar unit 1 Minggu ( Syarat dan ketentuan berlaku) kelengkapan : ️ carger ️ dus ️ kartu garansi & INVOICE ️ TAS (Selama Stok Masih ADA) *Semua barang yang kita kirim akan kami cek terlebih dahulu kondisi fisik dan kelengkapanya, supaya tidak ada feedback negatif dari pelanggan. NOTE : ️ Untuk berat sudah termasuk Free Buble Wrap TEBAL dan belum termasuk packing kayu (jika di inginkan) ️ jika ingin pakai Go-Send, mohon konfirmasi dulu untuk ketersediaan stock nya ️ Wajib untuk unboxing di video .. Komplain tanpa video unboxing tidak kita terima',
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
                        title: 'Lenovo Legion Pro',
                        image: '../assets/images/laptop/lenovolegion.jpeg',
                        price:
                            'Rp 20.000.000', // Ensure the correct price is passed
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
                              'title': 'Lenovo Legion Pro',
                              'price': 'Rp 20.000.000',
                              'image':
                                  '../assets/images/laptop/lenovolegion.jpeg',
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
