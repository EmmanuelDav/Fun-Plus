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
  Future<List<JokeModel>> getJoke(String category) async {
    final response = await http.get(Uri.parse("https://v2.jokeapi.dev/joke/$category?amount=10"));
    if (response.statusCode == 200) {
      return (json.decode(response.body)['jokes'] as List)
          .map((e) => JokeModel.fromMap(e))
          .toList();
    } else {
      throw Exception("Failed to load joke");
    }
  }
}