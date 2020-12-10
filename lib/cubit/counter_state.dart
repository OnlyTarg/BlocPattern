part of 'counter_cubit.dart';

@immutable
abstract class CounterState {


}

class Counter extends CounterState {
  final int count;

  Counter(this.count);
}
