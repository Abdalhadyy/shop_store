import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginAttemptsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل الدخول'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('loginAttempts').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('خطأ: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('لا توجد بيانات.'));
          }

          // إذا كان هناك بيانات، يتم عرضها
          final loginAttempts = snapshot.data!.docs;

          return ListView.builder(
            itemCount: loginAttempts.length,
            itemBuilder: (context, index) {
              var data = loginAttempts[index];
              return ListTile(
                title: Text('البريد الإلكتروني: ${data['email']}'),
                subtitle: Text('الحالة: ${data['status']}'),
                trailing: Text('الوقت: ${data['timestamp']}'),
                
              );
            },
          );
        },
      ),
    );
  }
}
