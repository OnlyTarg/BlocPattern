import 'package:bloc_lib/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  CounterCubit counterCubit;

  @override
  Widget build(BuildContext context) {
    @override
    void dispose() {
      counterCubit.close();
      super.dispose();
    }

     counterCubit = CounterCubit(Counter(0));

     //counterBloc = CounterBloc(Counter(0));
    return Scaffold(
      appBar: AppBar(
        title: Text('counter app'),
      ),
      body: BlocBuilder(
        cubit: counterCubit,
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
            onPressed: () { counterCubit.increment();},
            tooltip: 'Decrement',
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () { counterCubit.decrement();},
            tooltip: 'Increment',
            child: Icon(Icons.remove),
          ),
        ],
      )
    );
  }
}
