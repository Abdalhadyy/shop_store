import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  // دالة إرسال البريد الإلكتروني
  // ملاحظة: يجب استخدام متغيرات البيئة أو Firebase Cloud Functions للأمان
  Future<void> sendEmailNotification(String email) async {
    // TODO: استبدل هذا برابط Firebase Cloud Function حقيقي
    // لا تضع كلمات المرور في الكود مباشرة لأسباب أمنية
    print('إشعار: تم تسجيل دخول بواسطة $email');
    
    // مثال للاستخدام المستقبلي مع Cloud Functions:
    // await http.post(
    //   Uri.parse('https://YOUR_CLOUD_FUNCTION_URL'),
    //   body: {'email': email},
    // );
  }

  // دالة لإعادة تعيين كلمة المرور
  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('تم إرسال رابط إعادة تعيين كلمة السر إلى بريدك الإلكتروني')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطأ: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/back.jpg'),
        fit: BoxFit.fill,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey,
          title: const Text(
            "تسجيل الدخول",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/el-logo.webp',
                  width: 220,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "البريد الإلكتروني",
                    border: OutlineInputBorder(),
                    filled: true,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: "كلمة السر",
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(500, 50),
                      backgroundColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  onPressed: () async {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();

                    if (email.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("يرجى ملء جميع الحقول")),
                      );
                      return;
                    }

                    try {
                      // تسجيل الدخول
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );

                      // تسجيل المحاولة الناجحة في Firestore
                      await FirebaseFirestore.instance
                          .collection('loginAttempts')
                          .add({
                        'email': email,
                        'status': 'نجاح',
                        'timestamp': DateTime.now(),
                      });

                      // إرسال إشعار بالبريد الإلكتروني
                      await sendEmailNotification(email);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("تم تسجيل الدخول بنجاح")),
                      );

                      // التوجيه إلى الصفحة الرئيسية
                      Navigator.pushReplacementNamed(context, "homepage");
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("خطأ: ${e.toString()}")),
                      );

                      // تسجيل المحاولة الفاشلة في Firestore
                      await FirebaseFirestore.instance
                          .collection('loginAttempts')
                          .add({
                        'email': email,
                        'status': 'فشل',
                        'timestamp': DateTime.now(),
                      });
                    }
                  },
                  child: const Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'signup');
                  },
                  child: const Text(
                    "إنشاء حساب جديد",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    String email = emailController.text.trim();

                    if (email.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                "يرجى إدخال بريدك الإلكتروني لإعادة تعيين كلمة السر")),
                      );
                      return;
                    }

                    await resetPassword(email);
                  },
                  child: const Text(
                    "هل نسيت كلمة السر؟",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
