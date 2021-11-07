import 'package:demo02/router.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'models/model_todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Todo todo = Todo(DateTime.now(), title: "Title", cmt: "CMT");
  List<Todo> listTodo1 = [];

  int index01 = 1 ;




  @override
  Widget build(BuildContext context) {
    listTodo1.add(todo);



    return DataInheritedWidget(
      intdexTodo: index01,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration.collapsed(
                              hintText: "Thêm Todo",
                              hintStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
                  RaisedButton(
                    padding: const EdgeInsets.all(15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Colors.teal,
                    onPressed: () {
                      setState(() {

                      });
                    },
                    child: Text(
                      index01.toString(),
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
              const Divider(),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: listTodo1.length,
                  itemBuilder: (context, index) {
                    return item(context, index, listTodo1[index]);
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            final data = context.dependOnInheritedWidgetOfExactType<DataInheritedWidget>();
            print(data!.intdexTodo);
          },
        ),
      ),
    );
  }
  item(context , int index, Todo todo) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, RouteName.page,arguments: index);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(30)
        ),
        margin: const EdgeInsets.all(5),
        height: 100,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30), color: Colors.teal),
                child: Center(child: Text(todo.datetime!.day.toString())),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    Text(todo.title, style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                    Text(todo.cmt, overflow: TextOverflow.ellipsis,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


