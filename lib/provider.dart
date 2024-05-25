import 'dart:core';

import 'package:flutter/material.dart';

class ui extends ChangeNotifier {
  bool isdark = false;
  String dark = '';
  String get darkmode => dark;
  changetheme() {
    print("njj");
    isdark = !isdark;

    ThemeMode dark = ThemeMode.dark;
    dark = darkmode as ThemeMode;
    notifyListeners();
  }
}
