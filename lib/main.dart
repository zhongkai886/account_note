import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_account_note/account.info.view.dart';
import 'package:flutter_account_note/basic_view.dart';
import 'package:flutter_account_note/callback_view.dart';
import 'package:flutter_account_note/image_picker_page.dart';
import 'package:flutter_account_note/main_view.dart';
import 'package:flutter_account_note/model/account.info.dart';
import 'package:flutter_account_note/shop/cart/cart_model.dart';
import 'package:flutter_account_note/shop/shop_view.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AccountInfoAdapter());
  await Hive.openBox<AccountInfo>('accountInfos');
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const IMAGEPICKER = '/imagePicker';
  static const BASIC = '/basic';
  static const CALLBACK = '/callback';
  static const SHOP = '/shop';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const MainView(),
        BASIC: (context) => const BasicView(),
        IMAGEPICKER: (context) => const ImagePickerPage(),
        CALLBACK: (context) => const CallBackView(),
        SHOP: (context) => ChangeNotifierProvider(
              create: (context) => CartModel(),
              child: const ShopView(),
            ),
      },
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
    );
  }
}
