import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/JokeEvent.dart';
import '../Bloc/JokeStates.dart';
import '../Bloc/JokerBloc.dart';
import '../model/Data.dart';
import '../model/classes.dart';

class ViewMore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => More();
}

class More extends State<ViewMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(""), backgroundColor: Colors.transparent, elevation: 0),
      body: Scaffold(
          body: RefreshIndicator(
        onRefresh: () {
          BlocProvider.of<JokeBloc>(context).add(LoadJokeEvent('programming'));
        },
        child: Column(
          children: [
            Container(
              height: 100,
              child: Expanded(
                child: HorizontalListView(),
              ),
            ),
            Container(
              child: Expanded(
                child: RepositoryProvider(
                  create: (context) => JokeRepository(),
                  child: checkingState(),
                ),
              ),
            )
          ],
        ),
      )),
    );
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

  Widget checkingState() {
    return BlocProvider(
        create: (context) =>
            JokeBloc(RepositoryProvider.of(context))..add(LoadJokeEvent('Any')),
        child: BlocBuilder<JokeBloc, JokeState>(
          builder: (context, state) {
            if (state is JokeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is JokeLoadedState) {
              return ListView.builder(
                  itemCount: state.joke.length,
                  itemBuilder: (context, index) =>
                      MyExpandableWidget(state.joke[index]));
            }
            if (state is JokeErrorState) {
              return Center(
                child: Text(state.error.toString()),
              );
            }
            return Container();
          },
        ));
  }
}

class MyExpandableWidget extends StatelessWidget {
  final JokeModel model;

  MyExpandableWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionTile(
          title: Text(
            model.setup,
            style: TextStyle(fontSize: 20),
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
