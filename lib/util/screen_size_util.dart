import 'package:flutter/material.dart';

class ScreenSizeUtil {
  static getWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static getHeight(BuildContext context) => MediaQuery.of(context).size.height;
}
