import 'package:bloc_lib/fromScratch/counter_bloc.dart';
import 'package:bloc_lib/fromScratch/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fromScratch/counterState.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      counterBloc.dispose();
      super.dispose();
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('counter app'),
        ),
        body: StreamBuilder<Object>(
            initialData: Counter(0),
            stream: counterBloc.counterStream,
            builder: (context, AsyncSnapshot snapshot) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${snapshot.data.count}',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              );
            }),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                counterBloc.eventSink.add(IncrementEvent());
              },
              tooltip: 'Decrement',
              child: Icon(Icons.add),
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                counterBloc.eventSink.add(DecrementEvent());
              },
              tooltip: 'Increment',
              child: Icon(Icons.remove),
            ),
          ],
        ));
  }
}
