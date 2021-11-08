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



  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    final data = DataInheritedWidget.of(context).listTodo;
    final DateTime dateTime = DateTime.now();
    return Scaffold(
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
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration.collapsed(
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
                      Todo todo = Todo(dateTime, title: _controller.text);
                      data.add(todo);
                    });
                  },
                  child: const Text(
                    "Add",
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
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return item(context, index, data);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
  item(context , int index, List<Todo> listTodo) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, RouteName.page,arguments: index);
      },
      child: Row(
        children: [
          Expanded(
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
                      child: const Center(child: Icon(Icons.access_time_filled, color: Colors.white,)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        children: [
                          Text(listTodo[index].title, style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),),
                          Text(listTodo[index].cmt, overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
            width: 30,
            child: GestureDetector(
              onTap: (){
                setState(() {
                  listTodo.removeAt(index);
                });
              },
              child: const Icon(Icons.clear),
            ),
          )
        ],
      ),
    );
  }
}


