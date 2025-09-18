import 'package:flutter/material.dart';
import '../widgets/todo_input_field.dart';
import '../widgets/todo_item.dart'; // ← 新しい部品を読み込み

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<String> _todos = [];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ToDoリスト')),
      body: Column(
        children: [
          TodoInputField(
            controller: _controller,
            onAdd: () {
              if (_controller.text.isNotEmpty) {
                setState(() {
                  _todos.add(_controller.text);
                  _controller.clear();
                });
              }
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                // ここでListTileを直接書く代わりにTodoItemを呼び出す
                return TodoItem(title: _todos[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
