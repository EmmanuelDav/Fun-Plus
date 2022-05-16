import 'dart:math';

import 'package:flutter/material.dart';
import 'Home.dart';

class HomeFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Home();
}

class Home extends State<HomeFragment> {
  List<CompanyStocks> stocksList = [
    CompanyStocks(name: "A10 NETWORKS INC.", price: 10.34),
    CompanyStocks(name: "Intel Corp", price: 56.96),
    CompanyStocks(name: "HP Inc", price: 32.43),
    CompanyStocks(name: "Advanced Micro Devices Inc.", price: 77.44),
    CompanyStocks(name: "Apple Inc", price: 133.98),
    CompanyStocks(name: "Amazon.com, Inc.", price: 3505.44),
    CompanyStocks(name: "Microsoft Corporation", price: 265.51),
    CompanyStocks(name: "Facebook", price: 339.1),
    CompanyStocks(name: "A10 NETWORKS INC.", price: 10.34),
    CompanyStocks(name: "Intel Corp", price: 56.96),
    CompanyStocks(name: "HP Inc", price: 32.43),
    CompanyStocks(name: "Advanced Micro Devices Inc.", price: 77.44),
    CompanyStocks(name: "Apple Inc", price: 133.98),
    CompanyStocks(name: "Amazon.com, Inc.", price: 3505.44),
    CompanyStocks(name: "Microsoft Corporation", price: 265.51)
  ];

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
}

class CompanyStocks {
  String name;
  double price;

  CompanyStocks({this.name, this.price});
}
