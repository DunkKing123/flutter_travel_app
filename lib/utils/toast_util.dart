
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


/**
 * 各个参数的说明
    参数名	说明
    msg	展示的文字内容
    toastLength	时间长短Toast.LENGTH_SHORT、Toast.LENGTH_LONG
    gravity	位置（上中下）ToastGravity.TOP、ToastGravity.CENTER、 ToastGravity.BOTTOM
    timeInSecForIos	展示时长，仅iOS有效
    bgcolor	背景颜色
    textcolor	文字颜色
    fontSize	文字大小
 */
class ToastUtil{

  static toast(String text){
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
//        timeInSecForIos: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0
    );
  }

}