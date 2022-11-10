import 'package:flutter/material.dart';

import 'colors.dart';

class AppStyles {
  static const TextStyle darkText = TextStyle(fontSize: 23, color: Colors.black, fontFamily: 'Poppins', fontWeight: FontWeight.bold);
  static TextStyle lightText = TextStyle(fontSize: 13, color: Colours.hintColor.code, fontWeight: FontWeight.normal);
  static TextStyle blackText = TextStyle(fontSize: 13, color: Colours.textBlack.code, fontWeight: FontWeight.normal);
  static TextStyle textBlue = TextStyle(fontSize: 13, color: Colours.blue.code, fontWeight: FontWeight.normal);
  static TextStyle textBlueUnderline = TextStyle(fontSize: 23, color: Colours.blue.code, fontWeight: FontWeight.bold, decoration: TextDecoration.underline,);
  static TextStyle textMedicineTitle = const TextStyle(fontWeight: FontWeight.bold);
  static TextStyle buttonText = const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.normal);
  static TextStyle appBarText = const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold);
}
