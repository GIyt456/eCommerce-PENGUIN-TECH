import 'package:flutter/material.dart';
import 'sukses_page.dart'; // Pastikan path ini sesuai

class ShippingPage extends StatefulWidget {
  @override
  _ShippingPageState createState() => _ShippingPageState();
}

class _ShippingPageState extends State<ShippingPage> {
  String selectedPaymentMethod = 'BRI'; // Default payment method

  @override
  Widget build(BuildContext context) {
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
              // Order Summary Section
              _buildSummaryRow('Order', 'Rp 15.999.999'),
              _buildSummaryRow('Shipping', 'Rp 15.000'),
              Divider(),
              _buildSummaryRow(
                'Total',
                'Rp 16.014.999',
                isBold: true,
                valueColor: Colors.orange,
              ),
              SizedBox(height: 20),

              // Payment Section
              Text(
                'Payment',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              _buildPaymentOption(
                icon: Icons.account_balance,
                title: 'Bank BRI',
                cardNumber: '********2109',
                paymentMethod: 'BRI',
              ),
              _buildPaymentOption(
                icon: Icons.payment,
                title: 'PayPal',
                cardNumber: '********2109',
                paymentMethod: 'PayPal',
              ),
              _buildPaymentOption(
                icon: Icons.account_balance,
                title: 'Bank Mandiri',
                cardNumber: '********2109',
                paymentMethod: 'Mandiri',
              ),
              _buildPaymentOption(
                icon: Icons.account_balance,
                title: 'Bank BCA',
                cardNumber: '********2109',
                paymentMethod: 'BCA',
              ),
              SizedBox(height: 20),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SuksesPage()),
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
}
