import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_account_note/main.dart';

class ShopView extends StatefulWidget {
  const ShopView({Key? key}) : super(key: key);
  @override
  State<ShopView> createState() => _ShopViewState();
}

class _ShopViewState extends State<ShopView> {
  @override
  Widget build(BuildContext context) {
    var snackBar = SnackBar(
      content: const Text(
        '您正離開商品頁唷!',
      ),
      action: SnackBarAction(
        label: '知道了',
        onPressed: () => showDialog(
          barrierDismissible: true,
          context: context,
          builder: (context) => Container(
            alignment: Alignment.center,
            child: const DefaultTextStyle(
              style: TextStyle(fontSize: 30),
              child: Text('知道就知道'),
            ),
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.SHOP.replaceAll('/', '')),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black45,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('個人頁面'),
              onTap: (() => Navigator.pop(context)),
            ),
            ListTile(
              title: const Text('離開'),
              onTap: () => {
                Navigator.popAndPushNamed(context, '/'),
                ScaffoldMessenger.of(context).showSnackBar(snackBar),
              },
            ),
          ],
        ),
      ),
    );
  }
}
