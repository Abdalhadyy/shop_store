import 'package:flutter/material.dart';
import 'pages/login_screen.dart'; // استيراد صفحة تسجيل الدخول
import 'pages/signup_screen.dart'; // استيراد صفحة التسجيل
import 'pages/Homepage.dart'; // استيراد الصفحة الرئيسية
import 'pages/cartpage.dart'; // استيراد صفحة السلة
import 'pages/itempage.dart'; // استيراد صفحة المنتجات
import 'package:shope/pages/onboarding_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF4C53A5),
      ),
      initialRoute: "/", // شاشة Onboarding دائمًا هي الشاشة الأولى
      routes: {
        "/": (context) => const OnboardingPage1(), // شاشة Onboarding
        "login": (context) => LoginScreen(), // صفحة تسجيل الدخول
        "signup": (context) => SignUpScreen(), // صفحة التسجيل
        "homepage": (context) => Homepage(), // الصفحة الرئيسية
        "cartpage": (context) => cartpage(), // صفحة السلة
        "itempage": (context) => itempage(), // صفحة المنتجات
      },
    );
  }
}
