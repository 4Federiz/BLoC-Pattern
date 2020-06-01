import 'package:bloc/blocs/counter_provider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /*
    We wrap the app at the highest level wanted with the Provider so the app is aware of data changes.
    Will take MaterialApp and wrap it with our provider in counter_provider.dart
     */
    return MyProvider(
      child: MaterialApp(
        title: 'BLoC Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    //We'll ref the contents of the BLoC to our data state.
    final bloc = MyProvider.of(context);

    /*
    We wrap the part of the presentation logic we want to be able to make use of the BLoC.
    We want the Scaffold because we have the FAB and the Text using the data.
     */
    return StreamBuilder<int>(
//      stream: null,
        stream: bloc.getTheCount, //We get the data here.
        builder: (context, snapshot_fromBuilderWhichHasOurData) {

          //Initialize the counter.
          snapshot_fromBuilderWhichHasOurData.data ?? bloc.changeTheCount(0);

          return Scaffold(
            appBar: AppBar(
              title: Text('BLoC Example'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${snapshot_fromBuilderWhichHasOurData.data}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                //We set the data here. arg: the sink
                bloc.changeTheCount(
                snapshot_fromBuilderWhichHasOurData.data + 1
                );
          },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          );
        });
  }
}
