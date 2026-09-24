// types_demo.dart：变量声明、字符串插值、空安全四件套
// 对应实践指南第二章「变量与类型系统」

/// 变量声明与内置类型演示。
void variableDemo() {
  var title = '第一次作业'; // 类型推断为 String
  int year = 2026;
  double score = 92.5;
  final now = DateTime.now(); // 运行时确定一次
  const pi = 3.14159; // 编译期常量

  print('--- 变量声明 ---');
  print('title: $title (${title.runtimeType})');
  print('year: $year (${year.runtimeType})');
  print('score: $score (${score.runtimeType})');
  print('now: $now (${now.runtimeType})');
  print('pi: $pi (${pi.runtimeType})');
}

/// 字符串插值演示：变量直接 $，表达式加花括号 ${}。
void interpolationDemo() {
  String name = '李华';
  double score = 92.5;
  print('--- 字符串插值 ---');
  print('你好，$name，成绩${score + 5}'); // 表达式需花括号
}

/// 可空值演示：?. 安全调用、?? 默认值。参数为 String?，分析器无法确定其值，
/// 因此不会触发死代码告警。
void demonstrateNullable(String? nickname) {
  print('nickname = $nickname');
  print('  ?.length = ${nickname?.length}'); // null 则短路返回 null
  print('  ?? 默认 = ${nickname ?? '未填写'}'); // null 则取默认值
}

/// 空安全四件套：可空声明、安全调用 ?.、空默认 ??、空断言 !、延迟初始化 late。
void nullSafetyDemo() {
  print('--- 空安全四件套 ---');

  // 情形一：值为 null
  demonstrateNullable(null);
  // 情形二：值非空
  demonstrateNullable('hu');

  // ! 空断言：用于分析器无法类型提升的可空值（如 Map 查表返回 String?）。
  //   说明：对局部可空变量赋值后，Dart 会做类型提升，此时用 ! 反而多余；
  //   而 Map 查表结果恒为 String?，分析器无法证明非空，! 在此真正必要。
  final Map<String, String> students = {'001': '李华'};
  final String name001 = students['001']!; // 断言查表结果非空
  print('students[001]! = $name001');

  // late：承诺使用前必赋值
  late String token;
  token = 'abc-123';
  print('late token = $token');
}
