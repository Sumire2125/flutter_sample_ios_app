import 'package:flutter/material.dart';

// 1つのToDoを表示するための部品（Widget）
class TodoItem extends StatelessWidget {
  // 表示するテキスト（必須）
  final String title;

  // コンストラクタ：titleを必須にする
  const TodoItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // 左にチェックボックス風のアイコン
      leading: const Icon(Icons.check_box_outline_blank),
      // 中央にToDoの文字を表示
      title: Text(title),
    );
  }
}
