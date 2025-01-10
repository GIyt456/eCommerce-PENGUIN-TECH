import 'package:flutter/material.dart';
import 'sukses_page.dart'; // Pastikan path ini sesuai

class ShippingPage extends StatefulWidget {
  final Map<String, String> product;

  ShippingPage({required this.product});

  @override
  _ShippingPageState createState() => _ShippingPageState();
}

class _ShippingPageState extends State<ShippingPage> {
  String selectedPaymentMethod = 'BRI'; // Default payment method
  late int productPrice;
  final int shippingFee = 15000; // Biaya pengiriman tetap

  // Detail metode pembayaran
  final Map<String, dynamic> paymentDetails = {
    'BRI': {'icon': Icons.account_balance, 'card': '********2109'},
    'PayPal': {'icon': Icons.payment, 'card': '********1234'},
    'Mandiri': {'icon': Icons.account_balance, 'card': '********5678'},
    'BCA': {'icon': Icons.account_balance, 'card': '********4321'},
  };

  @override
  void initState() {
    super.initState();
    // Konversi harga produk ke integer
    productPrice = int.parse(
      widget.product['price']!.replaceAll('.', '').replaceAll('Rp ', ''),
    );
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = productPrice + shippingFee;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Checkout',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Order',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildOrderItem(
                title: widget.product['title']!,
                price: widget.product['price']!,
                image: widget.product['image']!,
              ),
              SizedBox(height: 20),
              _buildSummaryRow('Subtotal', 'Rp ${_formatCurrency(productPrice)}'),
              _buildSummaryRow('Shipping', 'Rp ${_formatCurrency(shippingFee)}'),
              Divider(),
              _buildSummaryRow(
                'Total',
                'Rp ${_formatCurrency(totalPrice)}',
                isBold: true,
                valueColor: Colors.orange,
              ),
              SizedBox(height: 20),
              Text(
                'Payment',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              // Pilihan metode pembayaran
              ...paymentDetails.entries.map((entry) {
                return _buildPaymentOption(
                  icon: entry.value['icon'],
                  title: entry.key,
                  cardNumber: entry.value['card'],
                  paymentMethod: entry.key,
                );
              }).toList(),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      int totalPrice = productPrice + shippingFee;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SuksesPage(
                            paymentMethod: selectedPaymentMethod,
                            paymentIcon: paymentDetails[selectedPaymentMethod]['icon'],
                            cardNumber: paymentDetails[selectedPaymentMethod]['card'],
                            subtotal: productPrice,
                            shippingFee: shippingFee,
                            totalPrice: totalPrice,
                          ),
                        ),
                      );
                    },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderItem({
    required String title,
    required String price,
    required String image,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 5),
                Text(
                  price,
                  style: TextStyle(color: Colors.orange, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value,
      {bool isBold = false, Color valueColor = Colors.black}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption({
    required IconData icon,
    required String title,
    required String cardNumber,
    required String paymentMethod,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = paymentMethod;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedPaymentMethod == paymentMethod
                ? Colors.blue
                : Colors.grey[300]!,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
          color: selectedPaymentMethod == paymentMethod
              ? Colors.blue[50]
              : Colors.white,
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: selectedPaymentMethod == paymentMethod
                ? Colors.blue
                : Colors.grey,
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: selectedPaymentMethod == paymentMethod
                  ? Colors.blue
                  : Colors.black,
            ),
          ),
          subtitle: Text(cardNumber),
        ),
      ),
    );
  }

  String _formatCurrency(int amount) {
    return amount.toString().replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match match) => '${match[1]}.');
  }
}
