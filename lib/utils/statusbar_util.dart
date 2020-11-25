
import 'package:flutter/material.dart';

class StatusBarUtil {
  ///获取状态栏高度
  static getStatusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
}
