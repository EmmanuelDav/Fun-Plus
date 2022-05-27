import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_pluz/Presenter/more.dart';
import 'package:fun_pluz/main.dart';
import '../Bloc/JokeEvent.dart';
import '../Bloc/JokeStates.dart';
import '../Bloc/JokerBloc.dart';
import '../model/Data.dart';
import '../model/classes.dart';


class HomeFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => JokeRepository(),
        child: Home(),
      ),
    );
  }
}


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        JokeBloc(
            RepositoryProvider.of(context)
        )
          ..add(LoadJokeEvent()),
        child: Scaffold(
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.all(15),
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Text("Welcome Iyke",
                                  style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 17))),
                          Container(
                              child: Text("How can we help",
                                  style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      //   color: colorIncent,
                                      fontSize: 14)))
                        ],
                      ),
                    ),
                    Flexible(
                      child: Container(
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(top: 5, right: 20),
                          child: Icon(
                            Icons.account_circle,
                            size: 40,
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              Container(
                height: 120,
                child: Expanded(child: listItems()),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text("Our Service",
                          style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 14)),
                    ),
                    Flexible(
                      child: Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewMore()),
                            );
                          },
                          child: Text("View more",
                              style: TextStyle(
                                  fontFamily: 'Quicksand',
                                  color: Colors.grey,
                                  fontSize: 12)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Expanded(child: checkingState()),
              )
            ],
          ),
        ));
  }

  Widget listItems() {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: stocksList == 0 ? null : stocksList.length,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            child: Card(
              color: colorPrimary,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        stocksList[index].name,
                        style: TextStyle(
                          fontSize: 20,color: colorP
                        ),
                      ),
                      Text("\$ ${stocksList[index].price}",style: TextStyle(color: colorP),),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
  Widget checkingState() {
   return BlocBuilder<JokeBloc, JokeState>(
      builder: (context, state) {
        if (state is JokeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is JokeLoadedState) {
          return ListView.builder(
              itemCount: state.joke.length,
              itemBuilder: (context, index) => MyExpandableWidget(state.joke[index]));
        }
        if (state is JokeErrorState) {
          return Center(
            child: Text(state.error.toString()),
          );
        }
        return Container();
      },
    );
  }

}

class MyExpandableWidget extends StatelessWidget{
  final JokeModel model;

  MyExpandableWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionTile(
          title: Text( model.setup, style: TextStyle(fontSize: 20),
            textAlign: TextAlign.start,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                model.delivery,
                style: const TextStyle(
                  fontSize: 15,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



