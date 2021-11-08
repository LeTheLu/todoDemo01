import 'dart:convert';

import 'package:demo02/models/model_todo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  static Future<List<Todo>> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList("list") ?? [];
    List<Todo> listTodo = list.map((e) => Todo.fromMap(jsonDecode(e))).toList();
    return listTodo;
  }

  static saveData({required List<Todo> listTodo}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = listTodo.map((e) => json.encode(e.toMap())).toList();
    prefs.setStringList("list", list);
  }

}