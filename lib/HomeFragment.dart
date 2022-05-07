import 'package:flutter/material.dart';
import 'Home.dart';

class HomeFragment extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => Home();

}

class Home extends State<HomeFragment>{

  List <CompanyStocks> stocksList = [
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
    return listItems();
  }

  Widget listItems(){
    return ListView.builder(itemCount: stocksList == 0 ? null : stocksList.length,itemBuilder: (context, index) {
      return Card(
        child: Padding(padding: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              child: Text(
                stocksList[index].name,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              stocksList[index].name,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            trailing: Text("\$ ${stocksList[index].price}"),
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