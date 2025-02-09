import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String productName;
  final String description;
  final String imagePath;
  final double price;

  const ProductPage({
    Key? key,
    required this.productName,
    required this.description,
    required this.imagePath,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          productName,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF4C53A5),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                imagePath,
                height: 250,
                width: 250,
              ),
            ),
            SizedBox(height: 20),
            Text(
              productName,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "السعر: \$${price.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "الوصف",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5),
              ),
            ),
            SizedBox(height: 10),
            Text(
              description, // عرض الوصف الطويل هنا
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // وظيفة زر الإضافة إلى السلة
                  },
                  icon: Icon(Icons.shopping_cart),
                  label: Text("اضافه الي السله"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEEDEC2),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // وظيفة زر الشراء الآن
                  },
                  icon: Icon(Icons.payment),
                  label: Text("اشتري الان"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xfffeae4f),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}