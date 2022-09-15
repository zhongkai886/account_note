import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_account_note/main.dart';

class BasicView extends StatefulWidget {
  const BasicView({Key? key}) : super(key: key);

  @override
  State<BasicView> createState() => _BasicViewState();
}

class _BasicViewState extends State<BasicView> {
  @override
  Widget build(BuildContext context) {
    //Scaffold 常用的模板
    return Scaffold(
      //設定Basic畫面的上方Bar
      appBar: AppBar(
        title: Text(MyApp.BASIC.replaceFirst('/', '')),
      ),
      //設定固定的按鈕
      floatingActionButton: const FloatingActionButton.extended(
        onPressed: null,
        label: Text('Approve'),
        icon: Icon(Icons.thumb_up),
        backgroundColor: Colors.pink,
      ),

      //按鈕固定的位置 有多種選擇
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

      //固定於底部的按鈕欄 會在bottomNavigationBar上方
      persistentFooterButtons: [
        Container(
          alignment: Alignment.centerLeft,
          height: 30,
          child: const Text('tips : 99人喜歡你的貼文'),
        ),
      ],
      //設定置底的AppBar 配合按鈕排版
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 30.0),
      ),
      //會將AppBar以外的地方填滿
      body: Container(
        color: Colors.transparent,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => print('tap?'),
                child: Container(
                  color: Colors.black45,
                  height: 50,
                  // width: 50,
                  child: const Center(
                    child: Text('Tap'),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
