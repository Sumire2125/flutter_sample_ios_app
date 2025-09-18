// models/todo.dart に置いてもOK
class Todo {
  String title;
  bool isDone;

  Todo({
    required this.title,
    this.isDone = false, // 初期状態は未完了
  });
}
