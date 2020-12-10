part of 'counter_bloc.dart';

abstract class CounterEvent {
  const CounterEvent();
}

class IncrementEvent extends CounterEvent {

  @override
  List<Object> get props => throw UnimplementedError();
}
class DecrementEvent  extends CounterEvent{
  @override
  List<Object> get props => throw UnimplementedError();
}
