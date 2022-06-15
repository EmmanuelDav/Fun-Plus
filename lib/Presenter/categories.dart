import 'package:flutter/material.dart';
import 'package:fun_pluz/model/classes.dart';
import 'package:provider/provider.dart';
import '../Provider/themeProvider.dart';

class ExplorePage extends StatefulWidget {
  ExplorePage({Key key}) : super(key: key);
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {

  @override
  void initState() {
    super.initState();
    final postMdl = Provider.of<ThemeProvider>(context, listen: false);
    postMdl.getMeme(context);
  }

  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Programming meme"),backgroundColor: Colors.transparent, elevation: 0),
      body: RefreshIndicator(
        // ignore: missing_return
        onRefresh: () async {
          final postMdl = Provider.of<ThemeProvider>(context, listen: false);
          postMdl.getMeme(context);
        },
        child: Center(
          child:postMdl.memeLoaded? CircularProgressIndicator(): listItems(postMdl.meme),
        ),
      ),
    );
  }

  Widget listItems(List<ProgrammingMeme> mJokeApiArray) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: mJokeApiArray == 0 ? null : mJokeApiArray.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              margin: EdgeInsets.all(10),
              child: FadeInImage(
                fit: BoxFit.contain,
                image: NetworkImage(mJokeApiArray[index].Images),
                placeholder: AssetImage('assets/Images/pun.png'),
                alignment: Alignment.center,
              ),
            ),
          );
        });
  }
}  
