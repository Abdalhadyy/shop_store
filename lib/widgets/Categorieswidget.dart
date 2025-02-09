import 'package:flutter/material.dart';

class Categorieswidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // قائمة الأسماء التي ستظهر مع كل صورة
    List<String> categoryNames = [
      "ساعات" ,
      "طعام",
      "عربيات",
      "شنط",
      "صندل",
      "ملابس",
      "تلفونات",
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < categoryNames.length; i++) // تغيير من 1 إلى 0 لأننا نبدأ من 0
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "images/${i + 1}.png", // استخدام i + 1 لربط الصورة بالترتيب
                    width: 40,
                    height: 40,
                  ),
                  Text(
                    categoryNames[i], // استخدام الأسماء من القائمة
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}