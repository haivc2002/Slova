part of 'counter_bloc.dart';

class CounterEvent {}

class CounterIncrement extends CounterEvent {}

class CounterDecrement extends CounterEvent {}

abstract class CountdownEvent extends Equatable {
  const CountdownEvent();

  @override
  List<Object?> get props => [];
}

class CountdownStart extends CountdownEvent {
  final int duration;

  CountdownStart(this.duration);

  @override
  List<Object?> get props => [duration];
}

class CountdownPauseResume extends CountdownEvent {}

class CountdownReset extends CountdownEvent {}
