import 'dart:convert';
import 'package:http/http.dart' as http;


class CompanyStocks {
  String name;
  double price;

  CompanyStocks({this.name, this.price});
}

class League {
  String leagueName;
  List<Club> listClubs;

  League(this.leagueName, this.listClubs);
}

class Club {
  String clubName;
  List<Player> listPlayers;

  Club(this.clubName, this.listPlayers);
}

class Player {
  String playerName;

  Player(this.playerName);
}

class Jokes {
  int category;
  String type;
  String setup;
  String delivery;

  Jokes({this.category, this.type, this.setup, this.delivery});

  factory Jokes.fromJson(Map<String, dynamic> json) {
    return Jokes(
        category: json['category'],
        type: json['type'],
        setup: json['setup'],
        delivery: json['delivery']);
  }
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