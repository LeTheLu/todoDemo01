import 'package:demo02/models/model_todo.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  final Todo todo;
  const TodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex:1,
                    child: Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width -20,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                  child: Center(
                    child: Text(widget.todo.title,style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 30),
                  ),),
                )),
                const SizedBox(height: 20),
                Expanded(
                  flex: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                      child: SingleChildScrollView(
                        child: TextField(
                          decoration: InputDecoration.collapsed(hintText: "Text"),
                        ),
                      ),
                    ),
                  ),),
                Expanded(
                    flex: 3,
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width - 50,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Center(child: Text(widget.todo.datetime!.day.toString())),
                          ),
                          SizedBox(height: 20,),
                          Container(
                              height: 50,
                              width: 100,
                              child: RaisedButton(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(15))
                                ),
                                padding: EdgeInsets.all(10),
                                onPressed: (){

                                },
                                color: Colors.teal,
                                child: const Text("Save",style: TextStyle(color: Colors.white),),
                              )),
                        ],
                      ),
                    ))
              ],
            ),
        ),
      ),
    );
  }
}
