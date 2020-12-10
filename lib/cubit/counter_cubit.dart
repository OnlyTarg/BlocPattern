import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<Counter> {
  CounterCubit(Counter state) : super(state);



  void increment(){
    emit(Counter(state.count+1));
  }
  void decrement(){
    emit(Counter(state.count-1));
  }
}
