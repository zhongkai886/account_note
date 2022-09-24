import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:flutter_account_note/shop/model/catalog.dart';

//購物車 此購物車存在於多個畫面
//否則目錄頁加一件商品,卻不在購物車裡面

class CartModel extends ChangeNotifier {
  final List<int> _itemIds = []; //加購的商品id存放
  late CatalogModel _catalog; //私有目錄 僅能透過以下get,set 讀取寫入

  //1. 設定目錄內容
  CatalogModel get catalog => _catalog;

  //2. 取得目錄內容
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    notifyListeners();
  }
  //---------------------

  //_itemIds是選購的商品
  //map將id快速轉換成List<item>
  //白話: 購物車商品列表
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  int get totalPrice => items.fold(0, (total, current) => total + current.price);

  //------------------
  // add removeAll
  // 要對購物車操作 新增商品 移除全部
  // 所以皆需要notifyListeners 告訴我們畫面要更新了

  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void removeAll() {
    _itemIds.clear();
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}
