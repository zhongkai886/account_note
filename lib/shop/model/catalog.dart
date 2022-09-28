//建立目錄
import 'package:flutter/material.dart';
import 'package:flutter_account_note/shop/model/cart.dart';

class CatalogModel {
  //商品清單
  static List<String> itemNames = [
    'Spaghetti',
    'Currying',
    'Rice',
    'Noodles',
  ];

  //透過Id轉換成商品
  Item getById(int id) => Item(id, itemNames[id]);

  Item getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int price = 40;
  Item(this.id, this.name) : color = Colors.primaries[id % Colors.primaries.length];

  //hashCode 複寫為id
  @override
  int get hashCode => id;

  //運算符號判斷相等 == ,也複寫成比對id是否相同
  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
