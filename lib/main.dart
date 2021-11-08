import 'dart:convert';

import 'package:demo02/data.dart';
import 'package:demo02/models/model_todo.dart';
import 'package:demo02/router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_preferences_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  List<Todo> listTodo1 = [];

  late SharedPreferences prefs;

  @override
  void initState() {
      getInitData();
    super.initState();
  }

  getInitData() async {
    List<Todo> listTodo = await SharedPreferencesHelper.getData();
    setState(() {
      listTodo1 = listTodo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DataInheritedWidget(
      listTodo: listTodo1,
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RouteName.home,
        onGenerateRoute: Routes.generate,
      ),
    );
  }
}
