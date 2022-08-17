import 'package:flutter/material.dart';
import 'package:flutter_account_note/account.info.view.dart';
import 'package:flutter_account_note/image_picker_page.dart';
import 'package:flutter_account_note/main_view.dart';
import 'package:flutter_account_note/model/account.info.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(AccountInfoAdapter());
  await Hive.openBox<AccountInfo>('accountInfos');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const IMAGEPICKER = '/imagePicker';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const MainView(),
        IMAGEPICKER: (context) => ImagePickerPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
