import 'package:flutter/material.dart';

class DataInheritedWidget extends InheritedWidget {



  final Widget child;
  final int intdexTodo;

  const DataInheritedWidget({required this.child,required this.intdexTodo, Key? key,}) : super(key: key, child: child);


  static DataInheritedWidget of(BuildContext context) {
    final DataInheritedWidget? result = context.dependOnInheritedWidgetOfExactType<DataInheritedWidget>();
    assert(result != null, 'No DataInheriteWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(DataInheritedWidget oldWidget) {
    return intdexTodo != oldWidget.intdexTodo;
  }
}