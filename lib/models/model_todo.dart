class Todo {
  String title;
  String cmt;
  DateTime? datetime;

  Todo(this.datetime, {required this.title, this.cmt = ''});
}
