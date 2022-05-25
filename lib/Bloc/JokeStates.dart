import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import '../model/classes.dart';

@immutable
abstract class JokeState extends Equatable {
  
}

class JokeLoadingState extends JokeState {
  @override
  List<Object> get props => [];
}

class JokeLoadedState extends JokeState {
  final JokeModel joke;

  JokeLoadedState(this.joke);

  @override
  List<Object> get props => [joke];
}

class JokeErrorState extends JokeState {
  final String error;

  JokeErrorState(this.error);

  @override
  List<Object> get props => [error];
}