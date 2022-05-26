import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/classes.dart';
import 'JokeEvent.dart';
import 'JokeStates.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final JokeRepository _jokeRepository;

  JokeBloc(this._jokeRepository) : super(JokeLoadingState()) {
    on<LoadJokeEvent>((event, emit) async {
      emit(JokeLoadingState());
      try {
        final List<JokeModel> joke = (await _jokeRepository.getJoke());
        emit(JokeLoadedState(joke));
      } catch (e) {
        emit(JokeErrorState(e.toString()));
      }
    });
  }
}
