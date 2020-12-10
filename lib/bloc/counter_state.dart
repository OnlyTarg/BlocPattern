part of 'counter_bloc.dart';

abstract class CounterState extends Equatable {
   CounterState();
}

class Counter extends CounterState {
  final count;

  Counter(this.count);


  @override
  List<Object> get props => [count];
  @override
  String toString() {

    return count.toString();
  }
}

