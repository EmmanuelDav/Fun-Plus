
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