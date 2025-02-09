import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // لإزالة علامة DEBUG
      home: ScaffoldWithDrawer(), // استخدام ScaffoldWithDrawer هنا
    );
  }
}

class ScaffoldWithDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80), // تعديل حجم الـ AppBar
        child: HomeAppBar(), // استدعاء الـ AppBar
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                "Drawer Header",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text("Item 1"),
              onTap: () {
                // إجراء عند الضغط على العنصر
                Navigator.pop(context); // إغلاق الـ Drawer
              },
            ),
            ListTile(
              title: Text("Item 2"),
              onTap: () {
                Navigator.pop(context); // إغلاق الـ Drawer
              },
            ),
            ListTile(
              title: Text("Item 3"),
              onTap: () {
                Navigator.pop(context); // إغلاق الـ Drawer
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 30), // إضافة مسافة من الأعلى
          Expanded(
            child: Center(
              child: Text(
                "Content goes here!",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              // فتح الـ Drawer عند الضغط على الأيقونة
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.sort,
              size: 30,
              color: Color(0xFF4C53A5),
            ),
          ),
          SizedBox(width: 20),
          Text(
            "marketing",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4C53A5),
            ),
          ),
          Spacer(),
          badges.Badge(
            badgeContent: Text(
              "3",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, "cartpage");
              },
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 30,
                color: Color(0xFF4C53A5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
