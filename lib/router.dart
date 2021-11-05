import 'package:demo02/models/model_todo.dart';
import 'package:demo02/todo_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class RouteName {
  static const String home = "/";
  static const String page = "TodoPage";
}


class Routes{
  static Route<dynamic>? generate(RouteSettings settings){

    switch (settings.name){
      case "/": {
        return MaterialPageRoute(builder: (_) => const HomePage());
      }
      case "TodoPage": {
        Todo todo = settings.arguments as Todo;
        return MaterialPageRoute(builder: (_) => TodoPage(todo: todo,));
      }
    }
  }
}