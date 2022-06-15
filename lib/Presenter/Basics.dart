import 'package:flutter/material.dart';
import 'package:fun_pluz/Provider/themeProvider.dart';
import 'package:provider/provider.dart';
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
      appBar: AppBar(title: Text(""), backgroundColor: Colors.transparent, elevation: 0),
      body: Center(
        child: Container(
          child:postMdl.loading ? CircularProgressIndicator() : listItems(postMdl.post),
        ),
      ),
    );
  }

  Widget listItems(List<HumorJokesApi> mJokeApiArray) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: mJokeApiArray == 0 ? null : mJokeApiArray.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              margin: EdgeInsets.all(16),
              child: Text(mJokeApiArray[index].joke,style: TextStyle(fontSize: 18),),
            ),
          );
        });
  }
}
