import 'package:demo02/models/model_todo.dart';
import 'package:flutter/material.dart';

class DataInheritedWidget extends InheritedWidget {

  final List<Todo> listTodo;

  const DataInheritedWidget({
    required Widget child,
    required this.listTodo,
    Key? key,}) : super(key: key, child: child);


  static DataInheritedWidget of(BuildContext context) {
    final DataInheritedWidget? result = context.dependOnInheritedWidgetOfExactType<DataInheritedWidget>();
    assert(result != null, 'No DataInheriteWidget found in context');
    return result!;
  }


  @override
  bool updateShouldNotify(DataInheritedWidget oldWidget) {
    return oldWidget.listTodo != listTodo  ;
  }



}