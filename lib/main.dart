import 'dart:convert';

import 'package:demo02/data.dart';
import 'package:demo02/models/model_todo.dart';
import 'package:demo02/router.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    getData();
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.paused){
      saveData();
    }else if(state == AppLifecycleState.resumed){
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose(){
    saveData();
    super.dispose();
  }

  saveData() {
    List<String> list = listTodo1.map((e) => json.encode(e.toMap())).toList();
    prefs.setStringList("list", list);
  }

  getData() async {
    prefs = await SharedPreferences.getInstance();
    loadData();
  }

  loadData() {
    List<String> list = prefs.getStringList("list") ?? [];
    listTodo1 = list.map((e) => Todo.fromMap(jsonDecode(e))).toList();
    setState(() {});
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
