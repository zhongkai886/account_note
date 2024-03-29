import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_account_note/account.info.view.dart';
import 'package:flutter_account_note/basic_view.dart';
import 'package:flutter_account_note/bloc/counterCubit.dart';
import 'package:flutter_account_note/bloc/counterPage.dart';
import 'package:flutter_account_note/callback_view.dart';
import 'package:flutter_account_note/image_picker_page.dart';
import 'package:flutter_account_note/main_view.dart';
import 'package:flutter_account_note/model/account.info.dart';
import 'package:flutter_account_note/shop/model/cart.dart';
import 'package:flutter_account_note/shop/model/catalog.dart';
import 'package:flutter_account_note/shop/screen/cartVIew.dart';
import 'package:flutter_account_note/shop/screen/catalogVIew.dart';
import 'package:flutter_account_note/shop/screen/loginView.dart';
import 'package:flutter_account_note/shop/shop_view.dart';
import 'package:flutter_account_note/todo/blocTodo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  static const LOGIN = '/login';
  static const CATALOG = '/catalog';
  static const CART = '/cart';
  static const COUNTER = '/counter';
  static const BLOCTODO = '/todo';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()), //商品目錄不會變動 所以
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => const MainView(),
          BASIC: (context) => const BasicView(),
          IMAGEPICKER: (context) => const ImagePickerPage(),
          CALLBACK: (context) => const CallBackView(),
          SHOP: (context) => ChangeNotifierProvider(
                create: (context) => Counter(),
                child: const ShopView(),
              ),
          //Shopping Provider View
          LOGIN: (context) => const Login(),
          CATALOG: (context) => const Catalog(),
          CART: (context) => const Cart(),
          COUNTER: (context) => BlocProvider(
                create: (context) => CounterCubit(),
                child: const CounterPage(),
              ),
          // BLOCTODO: (context) => BlocBuilder<CounterCubit, int>(
          //       builder: (context, state) => Text('$state'),
          //     ),
        },
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
      ),
    );
  }
}
