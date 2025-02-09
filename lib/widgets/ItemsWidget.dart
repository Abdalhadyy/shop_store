import 'package:flutter/material.dart';
import 'package:shope/pages/product_page.dart';

class ItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // قائمة أسماء المنتجات
    List<String> productNames = [
      "الساعات",
      "برجر",
      "عربيه مرسيدس",
      "شنط سيدات",
      "صندل بكعب",
      "ملابس رجال",
      " S24 Ultra سامسونج  ",
      "طعام",
      "عربيات",
      "شنط",
      "صندل",
      "بدل رجالي",
      "iPhone 13 pro",
      "ساعات",
    ];

    // قائمة النصوص لكل صورة باللغة الإنجليزية
    List<String> descriptions = [
      ".ساعه يد انيقه بتصميم عصري يناسب جميع الاذواق",
      ".وجبه لذيذه وطازجه لاشباع شهيتك ",
      ".سياره مرسيدس فاخره بمواصفات عالميه المستوي ",
      ".حقيبه  يد نسائيه انيقه بتصميم انيق ",
      ". حذاء نسائي بكعب انيق ومريح للاستخدام اليومي",
      ".ملابس رجاليه عصريه باقمشه عاليه الجوده ",
      " هاتف سامسونج الترا s24 مزود باحدث التقنيات والكاميرات",
      ".وجبه مخنلفه ولذيذه لجميع المناسبات ",
      ".سياره فراري رياضيه ذات اداء استثنائي ",
      ".حقيبه نسائيه  انيقه تناسب كافه المناسبات",
      ".حذاء بكعب فريد وعصري بتصميم عصري ",
      ".ملابس ذات انماط معاصره ومريحه ",
      "شاشه مقاس 6.1 بوصه شريحه a15 ",
      ".ساعه يد بتصميم مميز لذوق رفيع",
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.count(
            childAspectRatio: 0.68,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            shrinkWrap: true,
            children: [
              for (int i = 0; i < descriptions.length; i++)
                Container(
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 10,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Color(0xFF4C53A5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "-50%",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductPage(
                                productName: productNames[i], // اسم المنتج
                                description: descriptions[i], // الوصف الطويل
                                imagePath: "images/${i + 1}.png", // صورة المنتج
                                price: 100 + i * 50, // السعر
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Image.asset(
                            "images/${i + 1}.png",
                            height: 120,
                            width: 120,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 8),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          productNames[i], // استخدام اسم المنتج بدلاً من Item
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF4C53A5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          descriptions[i], // النص المختلف لكل عنصر
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF4C53A5),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                "\$${100 + i * 50}", // سعر مختلف لكل عنصر
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4C53A5),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.shopping_cart_checkout,
                              color: Color(0xFF4C53A5),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
