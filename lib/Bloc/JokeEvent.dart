import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class JokeEvent extends Equatable {
  const JokeEvent();
}

class LoadJokeEvent extends JokeEvent {
  String category;
  LoadJokeEvent(this.category)

  @override
  List<Object> get props => [category];
}