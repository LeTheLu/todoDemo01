import 'package:demo02/router.dart';
import 'package:demo02/shared_preferences_helper.dart';
import 'package:flutter/material.dart';

import 'data.dart';
import 'models/model_todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  List<Todo> listTodo = [];

  @override
  void initState() {
    super.initState();
    getInitData();
  }

  getInitData() async {
    List<Todo> data = await SharedPreferencesHelper.getData();
    setState(() {
      listTodo = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DataInheritedWidget(
        listTodo: listTodo,
        child : const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.home,
      onGenerateRoute: Routes.generate,
    ));
  }
}
