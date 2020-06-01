import 'package:rxdart/rxdart.dart';

class MyBloc {
  //RxDart observable. Could be PublishedSubject<T>().
  final _counter = BehaviorSubject<int>(); //Throws last value submitted.

  //We get the data from _counter.
  Stream<int> get getTheCount => _counter.stream;

  //We set the data into the Stream.
  Function(int) get changeTheCount => _counter.sink.add;

  //Dispose of Streams.
  dispose() {
    _counter.close();
  }
}