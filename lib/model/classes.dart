import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

class Category {
  String Image;
  String category;

  Category(this.Image, this.category);
}

class JokeModel {
  JokeModel({
    this.setup,
    this.delivery,
    this.id,
    this.category,
  });

  String setup;
  String delivery;
  int id;
  String category;

  factory JokeModel.fromMap(Map<String, dynamic> json) => JokeModel(
        setup: json["setup"] ?? json["joke"],
        delivery: json["delivery"] ?? "",
        category: json["category"] ?? "",
        id: json["id"],
      );
}

class JokeRepository {
  Future<List<JokeModel>> getJoke(String category) async {
    final response = await http
        .get(Uri.parse("https://v2.jokeapi.dev/joke/$category?amount=10"));
    if (response.statusCode == 200) {
      return (json.decode(response.body)['jokes'] as List)
          .map((e) => JokeModel.fromMap(e))
          .toList();
    } else {
      throw Exception("Failed to load joke");
    }
  }
}

class OnBoardModel {
  String imgStr;
  String description;
  String titlestr;

  OnBoardModel(this.imgStr, this.description, this.titlestr);
}

class HumorJokesApi {
  HumorJokesApi({this.id, this.joke,});

  String id;
  String joke;

  factory HumorJokesApi.fromMap(Map<String, dynamic> json) => HumorJokesApi(
      id: json['id'],
      joke: json['jokes']
  );
}

Future<List<HumorJokesApi>> getListHumorData(String apiKey, String category) async {
  List<HumorJokesApi> result;
  try {
    final response = await http.get(
      Uri.parse(
          "https://api.humorapi.com/jokes/search?api-key=47ded75a601c45c4b13a2838f1cbcd26&number=20&keyword=$category"),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
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
