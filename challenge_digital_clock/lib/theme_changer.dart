import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  String _mode;

  ThemeChanger(this._mode);

  String getMode() => this._mode;

  setTheme(String theme) {
    _mode = theme;
    notifyListeners();
  }
}
