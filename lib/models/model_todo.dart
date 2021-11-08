class Todo {
  String title;
  String cmt;

  Todo({required this.title, this.cmt = ''});

  Todo.fromMap(Map map) :
        title = map['title'],
        cmt = map['cmt'];

  Map toMap(){
    return{
      'title' : title,
      'cmt' : cmt,
    };
  }

}
