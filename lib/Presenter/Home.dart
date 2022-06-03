import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fun_pluz/Presenter/more.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Bloc/JokeEvent.dart';
import '../Bloc/JokeStates.dart';
import '../Bloc/JokerBloc.dart';
import '../constants.dart';
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
          ..add(LoadJokeEvent('Any')),
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
                              child: Text("Welcome",
                                  style: GoogleFonts.getFont('Poppins',
                                      fontSize: 30,fontWeight: FontWeight.bold))),
                          Container(
                              child: Text("Jokes are gate ways to the soul",
                                  style: GoogleFonts.getFont('Quicksand',
                                      fontSize: 14,fontWeight: FontWeight.bold)))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 250,
                child: Expanded(child: listItems()),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      child: Text("Popular",
                          style: TextStyle(
                              fontSize: 20)),
                    ),
                    Flexible(
                      child: Container(
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.all(10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(            primary: Colors.transparent,),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewMore()),
                            );
                          },
                          
                          child:  Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('More'), // <-- Text
                              SizedBox(
                                width: 5,
                              ),
                              Icon( // <-- Icon
                                Icons.play_arrow_rounded,
                                size: 24.0,
                              ),
                            ],
                          ),
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
            child: Card(
              color: CustomColors.PrimaryScreen,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  child: Column(
                    children: [
                      Image.asset(stocksList[index].Image),
                      Text(stocksList[index].category,style: TextStyle(color: CustomColors.GreyMini),),
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



