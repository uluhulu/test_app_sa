import 'package:flutter/cupertino.dart';

class ThemeNotifier extends ChangeNotifier{
  bool isDarkTheme = false;

   void changeTheme () {
     isDarkTheme = !isDarkTheme;
     notifyListeners();
  }
}