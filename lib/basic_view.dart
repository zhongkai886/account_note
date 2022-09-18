import 'dart:math';

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
  var _top = 0.0, _left = 0.0;
  bool buttonFocus = false;
  @override
  Widget build(BuildContext context) {
    //Scaffold 常用的模板

    return GestureDetector(
      onTap: () {
        buttonFocus = false;
        setState(() {});
      },
      child: Scaffold(
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
        body: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              top: _top,
              left: _left,
              child: GestureDetector(
                onTap: () {
                  _top = 200.0;
                  _left = 200.0;
                  setState(() {});
                },
                onTapDown: (tapDownDetails) {
                  print(tapDownDetails.globalPosition);
                  print(tapDownDetails.localPosition);
                },
                onLongPress: () {
                  buttonFocus = true;
                  setState(() {});
                },
                onPanUpdate: ((details) {
                  if (buttonFocus) {
                    _top = max(0, _top + details.delta.dy);
                    _left = max(0, _left + details.delta.dx);
                    if (_left > (context.size!.width - 50)) {
                      _left = context.size!.width - 50;
                    }
                    setState(() {});
                  }
                }),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    border: Border.all(
                      color: buttonFocus ? Colors.red : Colors.transparent,
                      width: 3,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: const Center(
                    child: Text('Tap'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
