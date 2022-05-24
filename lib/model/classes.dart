import 'dart:convert';

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

JokeModel jokeModelFromJson(String str) => JokeModel.fromJson(json.decode(str));

String jokeModelToJson(JokeModel data) => json.encode(data.toJson());

class JokeModel {
  JokeModel({this.setup, this.delivery, this.id, this.category,});

  String setup;
  String delivery;
  int id;
  String category;


  factory JokeModel.fromJson(Map<String, dynamic> json) => JokeModel(
    setup: json["setup"] ?? json["joke"],
    delivery: json["delivery"] ?? "",
    category: json["category"] ?? "",
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "setup": setup,
    "delivery": delivery,
    "id": id,
    "category":category,
  };
}
class JokeRepository {
  final String _baseUrl = "https://v2.jokeapi.dev/joke/Any";

  Future<JokeModel> getJoke() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      return jokeModelFromJson(response.body);
    } else {
      throw Exception("Failed to load joke");
    }
  }
}