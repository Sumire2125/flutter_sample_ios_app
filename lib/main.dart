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

// ステップ3
// ToDoリスト画面を表すWidget（ここはStatefulにする）
// StatefulWidget = 画面の中身が変化する（状態を持つ）Widget
class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  // createState() で状態クラスを紐づける
  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

// 画面の「状態」を管理するクラス
class _TodoListScreenState extends State<TodoListScreen> {
  // 入力されたToDoを保存するリスト
  final List<String> _todos = [];

  // 入力欄（TextField）の中身を操作するコントローラ
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 上のタイトルバー
      appBar: AppBar(title: const Text('ToDoリスト')),

      // 画面の中身を縦に並べる
      body: Column(
        children: [
          // 入力欄と＋ボタンを横に並べる部分
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // 入力欄（画面幅に合わせて広がるようにExpandedで包む）
                Expanded(
                  child: TextField(
                    controller: _controller, // 入力内容を取得するコントローラを設定
                    decoration: const InputDecoration(
                      hintText: '新しいToDoを入力', // 入力欄のヒント文字
                    ),
                  ),
                ),
                // ＋ボタン（アイコンボタン）
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    // 入力欄が空じゃなければ追加
                    if (_controller.text.isNotEmpty) {
                      setState(() {
                        // リストに入力内容を追加
                        _todos.add(_controller.text);
                        // 入力欄をクリア
                        _controller.clear();
                      });
                    }
                  },
                ),
              ],
            ),
          ),
          // ToDoリストを縦に表示する部分
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length, // リストの要素数
              itemBuilder: (context, index) {
                return ListTile(
                  // 左にチェックボックス風アイコン
                  leading: const Icon(Icons.check_box_outline_blank),
                  // 中央にToDoの文字列を表示
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