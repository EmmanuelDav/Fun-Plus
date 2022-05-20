import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_pluz/screens/Home.dart';
import 'package:fun_pluz/screens/categories.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<Widget> _items = [
    HomeFragment(),
    Categories(),
    Text("forth page"),
  ];
  int _selectedState = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: IndexedStack(
        index: _selectedState,
        children: _items,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.add_to_home_screen), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourite')
        ],
        currentIndex: _selectedState,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        elevation: 20,
        onTap: _OnTap,
      ),
    );
  }

  void _OnTap(int index) {
    _selectedState = index;
    setState(() {});
  }
}
