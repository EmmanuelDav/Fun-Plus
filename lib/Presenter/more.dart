import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc/JokeEvent.dart';
import '../Bloc/JokeStates.dart';
import '../Bloc/JokerBloc.dart';
import '../model/classes.dart';

class ViewMore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => More();
}

int _languageIndex = -1;

class More extends State<ViewMore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(""), backgroundColor: Colors.transparent, elevation: 0),
        body: RepositoryProvider(
          create: (context) => JokeRepository(),
          child: Scaffold(body: LoadJokes()),
        ));
  }

  Widget LoadJokes() {
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
              return RefreshIndicator(
                  onRefresh: () async {
                    BlocProvider.of<JokeBloc>(context)
                        .add(LoadJokeEvent('any'));
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        child: Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () async {
                                  BlocProvider.of<JokeBloc>(context)
                                      .add(LoadJokeEvent('any'));
                                  _languageIndex = 1;
                                },
                                child: _buildWidget("Any", 1),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  BlocProvider.of<JokeBloc>(context)
                                      .add(LoadJokeEvent('Music'));
                                  _languageIndex = 2;

                                },
                                child: _buildWidget("Music", 3),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  BlocProvider.of<JokeBloc>(context)
                                      .add(LoadJokeEvent('Programming'));
                                  _languageIndex = 4;
                                },
                                child: _buildWidget("Programming", 4),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  BlocProvider.of<JokeBloc>(context)
                                      .add(LoadJokeEvent('Dark'));
                                  _languageIndex = 5;
                                },
                                child: _buildWidget("Dark", 5),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  BlocProvider.of<JokeBloc>(context)
                                      .add(LoadJokeEvent('Pun'));
                                  _languageIndex = 6;
                                },
                                child: _buildWidget("Pun", 6),
                              ),
                              GestureDetector(
                                onTap: () {
                                  BlocProvider.of<JokeBloc>(context)
                                      .add(LoadJokeEvent('Spooky'));
                                  _languageIndex = 7;
                                },
                                child:  _buildWidget("Spooky", 7),
                              ),
                              GestureDetector(
                                onTap: () {
                                  BlocProvider.of<JokeBloc>(context)
                                      .add(LoadJokeEvent('Christmas'));
                                  _languageIndex = 8;
                                },
                                child: _buildWidget("Christmas", 8),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Expanded(
                          child: ListView.builder(
                              itemCount: state.joke.length,
                              itemBuilder: (mContext, index) =>
                                  MyExpandableWidget(state.joke[index])),
                        ),
                      ),
                    ],
                  ));
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

  Widget _buildWidget(String category, int index) {
    bool isSelected = _languageIndex == index;
    return Container(
      margin: EdgeInsets.all(3),
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
            color: isSelected ? Colors.blue[300].withOpacity(0.8)
                : Colors.grey[700]),
      ),
      child: Center(
          child: Text(
        category,
        style: TextStyle(fontSize: 18),
      )),
    );
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
