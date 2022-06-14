import 'package:flutter/material.dart';
import 'package:fun_pluz/model/classes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {

  bool isDarkTheme;
  ThemeProvider({this.isDarkTheme});

  List<HumorJokesApi> post ;
  bool loading = false;
  ThemeData get getThemeData => isDarkTheme ? darkTheme : lightTheme;
  String _category;


  saveProperty(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('boolValue', value);
  }

  set setThemeData(bool val) {
    if (val) {
      isDarkTheme = true;
    } else {
      isDarkTheme = false;
    }
    saveProperty(isDarkTheme);
    notifyListeners();
  }

  getPostData(context) async {
    loading = true;
    post = await getListHumorData(context,_category);
    loading = false;

    notifyListeners();
  }
}

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: Color(0xFF000000),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black54,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);
