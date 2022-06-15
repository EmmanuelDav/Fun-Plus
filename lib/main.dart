import 'package:flutter/material.dart';
import 'Presenter/Home.dart';
import 'Presenter/categories.dart';
import 'Presenter/favourite.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _items = [
    HomeFragment(),
    ExplorePage(),
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
              icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourite')
        ],
        currentIndex: _selectedState,
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
