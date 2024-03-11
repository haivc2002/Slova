part of 'counter_bloc.dart';

class CounterState {
  int count;
  CounterState({this.count = 0});
  CounterState copyWith({int? count}) {
    return CounterState(count: count ?? this.count);
  }
}

class CountdownState extends Equatable {
  final int duration;
  final bool isRunning;

  CountdownState(this.duration, this.isRunning);

  @override
  List<Object?> get props => [duration, isRunning];
}