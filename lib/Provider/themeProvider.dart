import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fun_pluz/model/classes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ThemeProvider with ChangeNotifier {

  bool isDarkTheme;
  ThemeProvider({this.isDarkTheme});
  ThemeData get getThemeData => isDarkTheme ? darkTheme : lightTheme;


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
  List<HumorJokesApi> post = [];
  bool loading = false;

  getPostData(context) async {
    loading = true;
    post = await getListHumorData();
    loading = false;
    notifyListeners();
  }


  Future<List<HumorJokesApi>> getListHumorData() async {

    const _api_key = "c279638f4cmshaaeb00ad4a7a3f3p19c71ejsna1f5a6803d79";
    const String _baseUrl = "https://jokes-by-api-ninjas.p.rapidapi.com/v1/jokes?limit=10";
    const Map<String, String> _headers = {
      "content-type": "application/json",
      "x-rapidapi-host": "jokes-by-api-ninjas.p.rapidapi.com",
      "x-rapidapi-key": _api_key,
    };

    List<HumorJokesApi> result;
    try {
      final response = await http.get(Uri.parse(_baseUrl),headers: _headers);

      if (response.statusCode == 200) {
        final item = json.decode(response.body) as List;
        result = item.map((e) => HumorJokesApi.fromMap(e)).toList();
      }else{
        throw Exception("Failed to load joke");
      }
    } catch (e) {
      log(e);
    }
    return result;
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

