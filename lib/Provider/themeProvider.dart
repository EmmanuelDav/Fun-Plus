import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fun_pluz/model/classes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:fun_pluz/auth/secret.dart';

class ThemeProvider with ChangeNotifier {

  List<HumorJokesApi> post = [];
  List<ProgrammingMeme> meme = [];
  bool loading = false;
  bool memeLoaded = false;
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


  getPostData(context) async {
    loading = true;
    post = await getListHumorData();
    loading = false;
    notifyListeners();
  }

  getMeme(context) async {
    memeLoaded = true;
    meme = await getProgrammingMeme();
    memeLoaded = false;
    notifyListeners();
  }


  Future<List<HumorJokesApi>> getListHumorData() async {

    const String _baseUrl = "https://jokes-by-api-ninjas.p.rapidapi.com/v1/jokes?limit=10";
    Map<String, String> _headers = {
      "content-type": "application/json",
      "x-rapidapi-host": "jokes-by-api-ninjas.p.rapidapi.com",
      "x-rapidapi-key": "$mySecretKey",
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

  Future<List<ProgrammingMeme>> getProgrammingMeme() async {

    const String _baseUrl = "https://programming-memes-images.p.rapidapi.com/v1/memes";
     Map<String, String> _headers = {
      "content-type": "application/json",
      "x-rapidapi-host": "programming-memes-images.p.rapidapi.com",
      "x-rapidapi-key": mySecretKey,
    };

    List<ProgrammingMeme> result;
    try {
      final response = await http.get(Uri.parse(_baseUrl),headers: _headers);

      if (response.statusCode == 200) {
        final item = json.decode(response.body) as List;
        result = item.map((e) => ProgrammingMeme.fromMap(e)).toList();
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

