import 'counter_bloc.dart';
import 'package:flutter/material.dart';

export 'counter_bloc.dart';

class MyProvider extends InheritedWidget {
  final MyBloc bloc;

  MyProvider({Key key, Widget child})
      : bloc = MyBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static MyBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(MyProvider) as MyProvider).bloc;
//    return (context.dependOnInheritedWidgetOfExactType() as MyProvider).bloc;
  }
}
