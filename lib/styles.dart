import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFFFFF8E1); // ベージュ
  static const accent = Colors.brown;          // メインの犬っぽい色
  static const accentLight = Color(0xFFD7CCC8); // 薄いブラウン
}

class AppTextStyles {
  static const todo = TextStyle(
    fontSize: 18,
    color: AppColors.accent,
  );

  static const done = TextStyle(
    fontSize: 18,
    color: Colors.grey,
    decoration: TextDecoration.lineThrough,
  );
}
