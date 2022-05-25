import 'package:flutter/material.dart';
import '../model/Data.dart';

class More extends State<ViewMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(""),backgroundColor: Colors.transparent,elevation: 0),
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
          'Pick_up Lines',
          style: TextStyle(fontSize: 18, color: Colors.white),
        )),
      ),
      Container(
        width: 200,
        color: Colors.purple[500],
        child: const Center(
            child: Text(
          'Jokes',
          style: TextStyle(fontSize: 18, color: Colors.white),
        )),
      ),
      Container(
        width: 200,
        color: Colors.purple[400],
        child: const Center(
            child: Text(
          'Mothers Joke',
          style: TextStyle(fontSize: 18, color: Colors.white),
        )),
      ),
      Container(
        width: 200,
        color: Colors.purple[300],
        child: const Center(
            child: Text(
          'Dirty Jokes',
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
      child: ListTile(
        leading: CircleAvatar(
          child: Text(data[index].leagueName),
          backgroundColor: Colors.purple,
        ),
        title: Text(''),
        subtitle:
            Text(""),
        trailing: Icon(Icons.add_a_photo),
      ),
    ),
  );
}
