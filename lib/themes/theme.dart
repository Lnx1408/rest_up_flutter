// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:rest_up_flutter/Templates/DesignApp.dart';

class CustomTheme with ChangeNotifier {
  ThemeData _themeData;

  CustomTheme(this._themeData);
  getTheme() => darkRestUp;

  setTheme(ThemeData theme) {
    _themeData = theme;
    notifyListeners();
  }

  ThemeData darkRestUp = ThemeData(
    brightness: Brightness.dark,
    primaryColor: DesignApp.colorPrimario,
    focusColor: DesignApp.colorSecundario,
  );
}
