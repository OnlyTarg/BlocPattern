import 'dart:async';

import 'package:bloc_lib/fromScratch/counterState.dart';
import 'package:bloc_lib/fromScratch/counter_event.dart';

class CounterBloc {
  CounterBloc() {
    listenData();
  }

  Counter counter = Counter(0);

  StreamController counterController = StreamController<Counter>();

  StreamSink get counterSink => counterController.sink;

  Stream get counterStream => counterController.stream;

  StreamController eventController = StreamController<CounterEvent>();

  StreamSink get eventSink => eventController.sink;

  Stream get eventStream => eventController.stream;

  listenData() {
    eventStream.listen((event) {
      if (event is IncrementEvent) {
        counter = Counter(counter.count + 1);
      }
      if (event is DecrementEvent) {
        counter = Counter(counter.count - 1);
      }
      counterSink.add(counter);
    });
  }

  void dispose() {
    counterController.close();
    eventController.close();
  }
}
