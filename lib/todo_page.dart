import 'package:demo02/data.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {



  @override
  Widget build(BuildContext context) {

    final data = context.dependOnInheritedWidgetOfExactType<DataInheritedWidget>();

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
                      flex:1,
                        child: GestureDetector(

                          onTap: (){
                            /*showDialog(
                                context: context,
                                builder: (BuildContext context) => _buildPopupDialog(context, listTodo1[widget.index].title));*/
                          },

                          child: Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width -20,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: const BorderRadius.all(Radius.circular(30))
                            ),
                      child: Center(
                          child: Text(data.intdexTodo.toString(),style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                    )),
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
                        child: Column(
                          children: [
                            const SizedBox(height: 20,),
                            Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width - 50,
                              decoration: const BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Center(child: Text("hello")),
                            ),
                            const SizedBox(height: 20,),
                            SizedBox(
                                height: 50,
                                width: 100,
                                child: RaisedButton(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(15))
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  onPressed: (){

                                  },
                                  color: Colors.teal,
                                  child: const Text("Save",style: TextStyle(color: Colors.white),),
                                )),
                          ],
                        ))
                  ],
                ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPopupDialog(BuildContext context, String title) {
    TextEditingController _controller  = TextEditingController();
    _controller.text = title;
    return AlertDialog(
        content:  Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(

              ),
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: Theme.of(context).primaryColor,
            child: const Text('Save'),
          ),
        ],
    );
  }
}
