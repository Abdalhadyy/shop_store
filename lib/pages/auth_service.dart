import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // تسجيل الدخول
  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // إرسال إشعار للإدمن عند تسجيل الدخول الناجح
      await sendNotificationToAdmin("نجاح", "تم تسجيل الدخول بنجاح بواسطة $email");
    } catch (e) {
      // إرسال إشعار للإدمن عند فشل تسجيل الدخول
      await sendNotificationToAdmin("فشل", "محاولة فاشلة لتسجيل الدخول بواسطة $email");
    }
  }

  // دالة إرسال الإشعار للإدمن
  Future<void> sendNotificationToAdmin(String status, String message) async {
    final url = "https://your-cloud-function-url"; // رابط الدالة السحابية
    await http.post(
      Uri.parse(url),
      body: {
        "status": status,
        "message": message,
      },
    );
  }
}
