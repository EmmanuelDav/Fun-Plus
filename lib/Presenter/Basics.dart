import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/themeProvider.dart';
import '../model/classes.dart';

class BasicHumorJokeCategory extends StatefulWidget {
  @override
  _ProviderDemoScreenState createState() => _ProviderDemoScreenState();
}

class _ProviderDemoScreenState extends State<BasicHumorJokeCategory> {
  @override
  void initState() {
    super.initState();
    final postMdl = Provider.of<ThemeProvider>(context, listen: false);
    postMdl.getPostData(context);
  }

  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(""), backgroundColor: Colors.transparent, elevation: 0),
      body: Container(
        height: 200,
        child: Expanded(child: listItems(postMdl.post)),
      ),
    );
  }

  Widget listItems(List<HumorJokesApi> mJokeApiArray) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: mJokeApiArray == 0 ? null : mJokeApiArray.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
              child: Card(
            margin: EdgeInsets.all(10),
            child: Text(mJokeApiArray[index].joke),
          ));
        });
  }
}
