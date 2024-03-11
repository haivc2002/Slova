import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc():super(CounterState()) {
    on<CounterIncrement>((event, emit) {
      emit(state.copyWith(count: state.count + 1));
    });
    on<CounterDecrement>((event, emit) {
      emit(state.copyWith(count: state.count - 1));
    });
  }
}

class CountdownBloc extends Bloc<CountdownEvent, CountdownState> {
  late Timer _timer;

  CountdownBloc() : super(CountdownState(0, false));

  @override
  Stream<CountdownState> mapEventToState(CountdownEvent event) async* {
    if (event is CountdownStart) {
      yield* _mapCountdownStartToState(event);
    } else if (event is CountdownPauseResume) {
      yield* _mapCountdownPauseResumeToState();
    } else if (event is CountdownReset) {
      yield* _mapCountdownResetToState();
    }
  }

  Stream<CountdownState> _mapCountdownStartToState(CountdownStart event) async* {
    if (_timer.isActive) {
      _timer.cancel();
    }

    yield CountdownState(event.duration, true);

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (state.duration > 0) {
        add(CountdownPauseResume());
      } else {
        _timer.cancel();
      }
    });
  }

  Stream<CountdownState> _mapCountdownPauseResumeToState() async* {
    if (state.isRunning) {
      _timer.cancel();
    } else {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (state.duration > 0) {
          add(CountdownPauseResume());
        } else {
          _timer.cancel();
        }
      });
    }

    yield CountdownState(state.duration, !state.isRunning);
  }

  Stream<CountdownState> _mapCountdownResetToState() async* {
    _timer.cancel();
    yield CountdownState(0, false);
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
