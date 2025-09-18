import 'package:flutter/material.dart';
import '../widgets/todo_input_field.dart';

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
          // 入力欄をWidgetとして切り出す
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
                return ListTile(
                  leading: const Icon(Icons.check_box_outline_blank),
                  title: Text(_todos[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
