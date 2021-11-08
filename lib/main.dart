import 'package:demo02/data.dart';
import 'package:demo02/models/model_todo.dart';
import 'package:demo02/router.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    Todo todo = Todo(DateTime.now(), title: "Title", cmt: "CMT");
    List<Todo> listTodo1 = [];
    listTodo1.add(todo);

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


