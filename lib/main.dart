import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Presenter/Home.dart';
import 'Presenter/categories.dart';
import 'Presenter/favourite.dart';

const colorIncent = const Color(0xffE8F1F5); // Second `const` is optional in assignments.
const colorPrimary = const Color(0xff005691); // Second `const` is optional in assignments.
const colorMain = const Color(0xff004A7C); // Second `const` is optional in assignments.
const colorP = const Color(0xffFAFAFA); // Second `const` is optional in assignments.


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: colorIncent,
        fontFamily: 'Quicksand',

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
    Favourite()
 ];
  int _selectedState = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        margin: EdgeInsets.only(top: 65),
        child: IndexedStack(
          index: _selectedState,
          children: _items,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.house), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourite')
        ],
        currentIndex: _selectedState,
        selectedItemColor: colorPrimary,
        unselectedItemColor: Colors.grey[300],
        elevation: 10,
        onTap: _OnTap,
      ),
    );
  }

  void _OnTap(int index) {
    _selectedState = index;
    setState(() {});
  }
}
