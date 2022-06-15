import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:fun_pluz/model/classes.dart';
import 'package:http/http.dart' as http;


class HumorDataProvider with ChangeNotifier {
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