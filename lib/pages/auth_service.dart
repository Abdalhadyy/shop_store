import 'package:firebase_auth/firebase_auth.dart';

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
  // TODO: استبدل هذا برابط Firebase Cloud Function حقيقي
  Future<void> sendNotificationToAdmin(String status, String message) async {
    // ملاحظة: يجب استخدام Firebase Cloud Functions أو خدمة إشعارات حقيقية
    print('إشعار للأدمن: [$status] $message');
    
    // مثال للاستخدام المستقبلي:
    // final url = \"https://YOUR_ACTUAL_CLOUD_FUNCTION_URL\";
    // await http.post(
    //   Uri.parse(url),
    //   body: {
    //     "status": status,
    //     "message": message,
    //   },
    // );
  }
}
