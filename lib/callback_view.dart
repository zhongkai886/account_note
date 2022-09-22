import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_account_note/main.dart';

class CallBackView extends StatefulWidget {
  const CallBackView({Key? key}) : super(key: key);

  @override
  State<CallBackView> createState() => _CallBackViewState();
}

class _CallBackViewState extends State<CallBackView> {
  double _size = 1.0;
  void grow() {
    setState(() {
      _size += 0.1;
    });
  }

  void reduce() {
    setState(() {
      _size -= 0.1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          MyApp.CALLBACK.replaceAll('/', '').toString(),
        ),
      ),
      body: SizedBox(
        child: GestureDetector(
          onTap: grow,
          onLongPress: reduce,
          child: Container(
            height: 100,
            width: 100,
            color: Colors.blueAccent,
            transform: Matrix4.diagonal3Values(_size, _size, 1.0),
          ),
        ),
      ),
    );
  }
}
