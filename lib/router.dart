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
        int index = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => TodoPage(index: index));
      }
    }
  }
}