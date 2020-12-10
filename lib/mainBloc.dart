import 'package:bloc_lib/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(Counter(0)),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CounterBloc counterBloc;

  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      counterBloc.close();
      super.dispose();
    }

     counterBloc = BlocProvider.of<CounterBloc>(context);
     //counterBloc = CounterBloc(Counter(0));
    return Scaffold(
      appBar: AppBar(
        title: Text('counter app'),
      ),
      body: BlocBuilder(
        cubit: counterBloc,
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${state.count}',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
          );
        },
       //cubit: counterBloc,
      ),
      floatingActionButton:
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () { counterBloc.add(IncrementEvent());},
            tooltip: 'Decrement',
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () { counterBloc.add(DecrementEvent());},
            tooltip: 'Increment',
            child: Icon(Icons.remove),
          ),
        ],
      )
    );
  }
}
