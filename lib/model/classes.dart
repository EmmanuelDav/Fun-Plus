import 'dart:convert';
import 'package:http/http.dart' as http;


class CompanyStocks {
  String name;
  double price;
  CompanyStocks({this.name, this.price});
}

class JokeModel {
  JokeModel({this.setup, this.delivery, this.id, this.category,});

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
  final String _baseUrl = "https://v2.jokeapi.dev/joke/Any?amount=10";

  Future<List<JokeModel>> getJoke() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return (json.decode(response.body)['jokes'] as List)
          .map((e) => JokeModel.fromMap(e))
          .toList();
    } else {
      throw Exception("Failed to load joke");
    }
  }
}