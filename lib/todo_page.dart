import 'package:demo02/data.dart';
import 'package:demo02/shared_preferences_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/model_todo.dart';

class TodoPage extends StatefulWidget {
  final Todo todo;
  const TodoPage({Key? key,required this.todo}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: GestureDetector(
                              onTap: () {
                                /*SharedPreferencesHelper.saveData(
                                    listTodo: data);*/

                                Navigator.pop(context);
                              },
                              child: const Icon(Icons.arrow_back_ios_new),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                /*showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        _buildPopupDialog(
                                            context: context,
                                            title: data[widget.index].title,
                                            index: widget.index));*/
                              },
                              child: Container(
                                  height: 100,
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(30))),
                                  child: Center(
                                    child: Text("home") /*Text(
                                      data[widget.index].title,
                                      style: const TextStyle(
                                          color: Colors.teal,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30),
                                    )*/,
                                  )),
                            ),
                          )
                        ],
                      )),
                  const SizedBox(height: 20),
                  Expanded(
                    flex: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15)),
                      child: SingleChildScrollView(
                        child: TextField(
                          textInputAction: TextInputAction.done,
                          controller: _controller,
                          /*onEditingComplete: () {
                            data[widget.index].cmt = _controller.text;
                          },*/
                          decoration:
                              const InputDecoration.collapsed(hintText: "Text"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopupDialog(
      {required BuildContext context,
      required String title,
      required int index}) {
    TextEditingController _controller = TextEditingController();
    _controller.text = title;

    final data = DataInheritedWidget.of(context).listTodo;

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            setState(() {
              data[index].title = _controller.text;
            });
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
