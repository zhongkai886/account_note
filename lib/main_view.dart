import 'package:flutter/material.dart';
import 'package:flutter_account_note/main.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MainView'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
          ),
          itemCount: 10,
          itemBuilder: ((context, index) {
            late String _title;
            switch (index) {
              case 0:
                _title = MyApp.IMAGEPICKER.replaceFirst('/', '');
                break;
              case 1:
                _title = MyApp.BASIC.replaceFirst('/', '');
                break;
              case 2:
                _title = MyApp.CALLBACK.replaceFirst('/', '');
                break;
              case 3:
                _title = MyApp.SHOP.replaceFirst('/', '');
                break;
              default:
                _title = index.toString();
            }
            return GestureDetector(
              onTap: () {
                switch (index) {
                  case 0:
                    Navigator.pushNamed(context, MyApp.IMAGEPICKER);
                    break;
                  case 1:
                    Navigator.pushNamed(context, MyApp.BASIC);
                    break;
                  case 2:
                    Navigator.pushNamed(context, MyApp.CALLBACK);
                    break;
                  case 3:
                    Navigator.pushNamed(context, MyApp.SHOP);
                    break;
                  case 4:
                    Navigator.pushNamed(context, MyApp.LOGIN);
                    break;
                }
              },
              child: Card(
                color: Colors.blue[100],
                child: Center(
                  child: Text(_title),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
