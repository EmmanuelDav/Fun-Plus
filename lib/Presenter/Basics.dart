import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../Provider/HumorJokeDataProvider.dart';
import '../Provider/themeProvider.dart';
import '../model/classes.dart';
class BasicStateful extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<SingleChildWidget> providers = [
      ChangeNotifierProvider<HumorDataProvider>(create: (_) => HumorDataProvider()),
    ];
    return MultiProvider(
      providers: providers,
      child: BasicHumorJokeCategory(),
    );
  }
}

class BasicHumorJokeCategory extends StatefulWidget {
  @override
  _ProviderDemoScreenState createState() => _ProviderDemoScreenState();
}

class _ProviderDemoScreenState extends State<BasicHumorJokeCategory> {
  @override
  void initState() {
    super.initState();
    final postMdl = Provider.of<HumorDataProvider>(context, listen: false);
    postMdl.getPostData(context,"dad");
  }

  @override
  Widget build(BuildContext context) {
    final postMdl = Provider.of<HumorDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(""), backgroundColor: Colors.transparent, elevation: 0),
      body: Container(
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
