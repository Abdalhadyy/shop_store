import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItemSamples extends StatefulWidget {
  @override
  _CartItemSamplesState createState() => _CartItemSamplesState();
}

class _CartItemSamplesState extends State<CartItemSamples> {
  final List<Map<String, dynamic>> items = [
    {"name": "ساعه", "price": "\$100", "quantity": 1, "isSelected": false},
    {"name": "برجر", "price": "\$130", "quantity": 1, "isSelected": false},
    {"name": "سياره مرسيدس", "price": "\$27,500", "quantity": 1, "isSelected": false},
  ];
  
  String? selectedItemId;
  
  void _updateQuantity(int index, int change) {
    setState(() {
      items[index]['quantity'] = (items[index]['quantity'] + change).clamp(1, 99);
    });
  }
  
  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < items.length; i++)
          Container(
            height: 110,
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Radio<String>(
                  value: items[i]['name'],
                  groupValue: selectedItemId,
                  activeColor: Color(0xFF4C53A5),
                  onChanged: (value) {
                    setState(() {
                      selectedItemId = value;
                      // تحديث حالة الاختيار للعناصر
                      for (var item in items) {
                        item['isSelected'] = (item['name'] == value);
                      }
                    });
                  },
                ),
                Container(
                  height: 70,
                  width: 70,
                  margin: EdgeInsets.only(right: 15),
                  child: Image.asset("images/${i + 1}.png"),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        items[i]["name"],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                      Text(
                        items[i]["price"],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteItem(i),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(minWidth: 0, minHeight: 0),
                              icon: Icon(CupertinoIcons.plus, size: 18),
                              onPressed: () => _updateQuantity(i, 1),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "${items[i]['quantity']}".padLeft(2, '0'),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4C53A5),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(minWidth: 0, minHeight: 0),
                              icon: Icon(CupertinoIcons.minus, size: 18),
                              onPressed: () => _updateQuantity(i, -1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
