import 'package:flutter/material.dart';

class TodoInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onAdd;

  const TodoInputField({
    super.key,
    required this.controller,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: '新しいToDoを入力',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: onAdd,
          ),
        ],
      ),
    );
  }
}
