// flow_demo.dart：运算符、分支与循环
// 对应实践指南第四章「运算符与控制流」

/// 成绩分级器：演示 if/else if 分支，条件必须是 bool。
String gradeOf(int score) {
  if (score >= 90) return '优';
  if (score >= 80) return '良';
  if (score >= 60) return '中';
  return '不及格';
}

void flowDemo() {
  print('--- 运算符：整除 ~/ 与除法 / ---');
  print('7 / 2 = ${7 / 2}'); // double: 3.5
  print('7 ~/ 2 = ${7 ~/ 2}'); // int: 3

  print('--- 分支：成绩分级 ---');
  for (final s in [95, 83, 66, 40]) {
    print('$s 分 -> ${gradeOf(s)}');
  }

  print('--- 循环：for-in 遍历集合 ---');
  for (final i in [1, 2, 3]) {
    print('第$i题');
  }
}
