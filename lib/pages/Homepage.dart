import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shope/widgets/CartBottomNavBar.dart';
import 'package:shope/widgets/Categorieswidget.dart';
import 'package:shope/widgets/HomeAppBar.dart'; // تأكد من استيراد الـ AppBar الخاص بك
import 'package:shope/widgets/ItemBottomNavBar.dart'; // تأكد من استيراد الـ ItemBottomNavBar
import 'package:shope/widgets/ItemsWidget.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0; // لتخزين الفهرس الحالي للنشاط

  // قائمة الويجيتس التي سيتم عرضها بناءً على الفهرس
  List<Widget> _pages = [
    // الصفحة الرئيسية
    Container(
      padding: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9), // شفافية للمحتوى
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: SingleChildScrollView( // إضافة التمرير هنا
        child: Column(
          children: [
            // مربع البحث
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    height: 50,
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "بحث ...",
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.search,
                    size: 27,
                    color: Color(0xFF4C53A5),
                  ),
                ],
              ),
            ),
            // العناوين
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                "الفئات",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),
                ),
              ),
            ),
            Categorieswidget(),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                "الأكثر مبيعا",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5),
                ),
              ),
            ),
            ItemsWidget(),
          ],
        ),
      ),
    ),
    // صفحة السلة (Cart)
    CartBottomNavBar(),
    // صفحة الـ Items
    ItemBottomNavBar(), // إضافة هنا
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), // تعديل حجم الـ AppBar
        child: HomeAppBar(), // هنا نقوم باستدعاء الـ AppBar
      ),
      body: Container(
        // إضافة الخلفية
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/back.jpg"), // صورة الخلفية
            fit: BoxFit.cover, // تغطية الشاشة بالكامل
          ),
        ),
        child: _pages[_currentIndex], // عرض الصفحة بناءً على الفهرس
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // تغيير الفهرس بناءً على الضغط
          });
        },
        height: 70,
        color: Color(0xFF4C53A5),
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            CupertinoIcons.cart_fill,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
