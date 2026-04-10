import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الرسائل'),
        backgroundColor: Color(0xFF4C53A5),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message_outlined,
              size: 100,
              color: Color(0xFF4C53A5),
            ),
            SizedBox(height: 20),
            Text(
              'لا توجد رسائل حالياً',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'سيتم عرض الرسائل هنا عند توفرها',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
