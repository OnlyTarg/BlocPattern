import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, Counter> {
  List<Counter> listOfStates = [];
  CounterBloc(Counter initialState) : super(initialState);

  @override
  Stream<Counter> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is IncrementEvent) {
      //yield  state..count+=1;
      if(listOfStates.length <10){
        listOfStates.add(state);
      }
      else if(listOfStates.length <10){

      }

      yield Counter(state.count+1);
      print(listOfStates);
    } else if (event is DecrementEvent) {
      yield Counter(state.count - 1);
      print(state.count);
    }
  }
}
