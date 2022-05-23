import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fun_pluz/screens/Home.dart';
import 'package:fun_pluz/screens/categories.dart';

const colorIncent = const Color(0xffF8ECD1); // Second `const` is optional in assignments.
const colorPrimary = const Color(0xff85586F); // Second `const` is optional in assignments.


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
    Text("forth page"),
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
              icon: Icon(Icons.add_to_home_screen), label: 'Home'),
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
