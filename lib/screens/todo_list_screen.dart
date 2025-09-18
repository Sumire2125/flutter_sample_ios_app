import 'package:flutter/material.dart';
import '../widgets/todo_input_field.dart';
import '../widgets/dismissible_todo_item.dart';
import '../models/todo.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<Todo> _todos = [];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50], // 柔らかい背景色
      appBar: AppBar(
        title: const Text('🐾 ToDoリスト'),
        backgroundColor: Colors.brown[200],
      ),
      body: Column(
        children: [
          TodoInputField(
            controller: _controller,
            onAdd: () {
              if (_controller.text.isNotEmpty) {
                setState(() {
                  _todos.add(Todo(title: _controller.text));
                  _controller.clear();
                });
              }
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                final todo = _todos[index];
                return DismissibleTodoItem(
                  todo: todo,
                  onDismissed: () {
                    setState(() {
                      _todos.removeAt(index);
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      todo.isDone = value ?? false;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
