import 'package:flutter/material.dart';
import '../models/todo.dart';

// スワイプ削除＋チェック付きのToDoアイテム
class DismissibleTodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onDismissed;
  final ValueChanged<bool?> onChanged;

  const DismissibleTodoItem({
    super.key,
    required this.todo,
    required this.onDismissed,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(todo.title),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        onDismissed();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${todo.title} を削除しました')),
        );
      },
      child: ListTile(
        leading: Checkbox(
          value: todo.isDone,
          onChanged: onChanged, // 呼び出し元で状態を更新
        ),
        title: Text(
          todo.title,
          style: TextStyle(
            decoration:
                todo.isDone ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
