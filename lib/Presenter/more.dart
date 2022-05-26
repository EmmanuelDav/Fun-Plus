import 'package:flutter/material.dart';
import '../model/Data.dart';

class More extends State<ViewMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(""), backgroundColor: Colors.transparent, elevation: 0),
      body: Column(
        children: [
          Container(
            height: 100,
            child: Expanded(
              child: HorizontalListView(),
            ),
          ),
          Container(
            child: Expanded(
              child: VerticalListView(),
            ),
          )
        ],
      ),
    );
  }
}

class ViewMore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => More();
}

Widget HorizontalListView() {
  return ListView(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      Container(
        width: 200,
        color: Colors.purple[600],
        child: const Center(
            child: Text(
          'Random',
          style: TextStyle(fontSize: 18, color: Colors.white),
        )),
      ),
      Container(
        width: 200,
        color: Colors.purple[500],
        child: const Center(
            child: Text(
          'Music',
          style: TextStyle(fontSize: 18, color: Colors.white),
        )),
      ),
      Container(
        width: 200,
        color: Colors.purple[400],
        child: const Center(
            child: Text(
          'Programming',
          style: TextStyle(fontSize: 18, color: Colors.white),
        )),
      ),
      Container(
        width: 200,
        color: Colors.purple[300],
        child: const Center(
            child: Text(
          'Dark',
          style: TextStyle(fontSize: 18, color: Colors.white),
        )),
      ),
      Container(
        width: 200,
        color: Colors.purple[300],
        child: const Center(
            child: Text(
          'Pun',
          style: TextStyle(fontSize: 18, color: Colors.white),
        )),
      ),
      Container(
        width: 200,
        color: Colors.purple[300],
        child: const Center(
            child: Text(
          'Spooky',
          style: TextStyle(fontSize: 18, color: Colors.white),
        )),
      ),
      Container(
        width: 200,
        color: Colors.purple[300],
        child: const Center(
            child: Text(
          'Christmas',
          style: TextStyle(fontSize: 18, color: Colors.white),
        )),
      ),
    ],
  );
}

Widget VerticalListView() {
  return ListView.builder(
    itemCount: data.length,
    itemBuilder: (context, index) => Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpansionTile(
              title: Text(
                '',
                textAlign: TextAlign.center,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '',
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
    ),
  );
}
