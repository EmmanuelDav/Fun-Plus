import 'dart:math';

import 'package:flutter/material.dart';
import '../utils/Data.dart';
import '../utils/classes.dart';
import '../main.dart';

class HomeFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Home();
}

class Home extends State<HomeFragment> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            child: Row(
              children: <Widget>[
                Container(
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text("Welcome Iyke",
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  color: Colors.blue,
                                  fontSize: 17))),
                      Container(
                          child: Text("How can we help",
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  color: Colors.grey,
                                  fontSize: 14)))
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                      alignment: Alignment.topRight,
                      margin: EdgeInsets.only(top: 5, right: 20),
                      child: Icon(
                        Icons.account_circle,
                        size: 40,
                      )),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Container(
            height: 120,
            child: Expanded(child: listItems()
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(
              children: [
                 Container(
                   margin: EdgeInsets.all(10),
                   child: Text("Our Service",
                      style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Colors.blue,
                          fontSize: 14)),
                 ),
                Flexible(
                   child: Container(
                     alignment: Alignment.topRight,
                     margin: EdgeInsets.all(10),
                     child: Text("View more",
                        style: TextStyle(
                            fontFamily: 'Quicksand',
                            color: Colors.grey,
                            fontSize: 12)),
                   ),
                ),
              ],
            ),
          ),
          Container(
            child: Expanded(child: verticalList()
            ),
          )
        ],
      ),
    );
  }

  Widget listItems() {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: stocksList == 0 ? null : stocksList.length,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Text(
                          stocksList[index].name,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        stocksList[index].name,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Text("\$ ${stocksList[index].price}"),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
  Widget verticalList(){
    return ListView.builder(itemCount: data.length, itemBuilder:(context, index) => MyExpandableWidget(data[index])
    );
  }
  
}

class MyExpandableWidget extends StatelessWidget {
  final League league;
  MyExpandableWidget(this.league);

  @override
  Widget build(BuildContext context) {
    if (league.listClubs.isEmpty) return ListTile(title: Text(league.leagueName));
    return ExpansionTile(key: PageStorageKey<League>(league),
      title: Text(league.leagueName, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.pinkAccent)),
      children: league.listClubs.map<Widget>((club) => showClubs(club)).toList(),
    );
  }
}

showClubs(Club club) {
  return new ExpansionTile(
    key: PageStorageKey<Club>(club),
    title: Text(club.clubName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.purpleAccent),),
    children: club.listPlayers.map<Widget>((player) => showPlayers(player)).toList(),
  );
}

showPlayers(Player player) {
  return new ListTile(
    title: new Text(
      player.playerName,
      style: new TextStyle(fontSize: 20),
    ),
  );
}

