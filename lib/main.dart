import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

// ホーム画面
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ホーム')),
      body: Center(
        child: ElevatedButton(
          child: const Text('ToDoリストへ'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TodoListScreen()),
            );
          },
        ),
      ),
    );
  }
}

// ToDoリスト画面（ステップ2）
class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ダミーデータ（あとで入力フォームで増やせるようにする）
    final todos = [
      '牛乳を買う',
      'Flutterを勉強する',
      'GitHubにpushする',
      '掃除する',
      'ランニングする',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('ToDoリスト')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.check_box_outline_blank),
            title: Text(todos[index]),
          );
        },
      ),
    );
  }
}

