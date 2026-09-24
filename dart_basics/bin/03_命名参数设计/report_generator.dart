// report_generator.dart：任务2·命名参数设计
// 为「实验报告生成器」设计函数签名并给出三种调用。
// 设计原则：必填用 required，可选给默认值或可空，统一命名参数风格（Flutter 组件风格）。

/// 生成实验报告文本。
///
/// 命名参数设计：
/// - [studentName] 必填，学生姓名
/// - [experimentTitle] 必填，实验名称
/// - [score] 必填，成绩（0-100）
/// - [className] 可选，班级（默认 '未填写'）
/// - [teacher] 可选，指导教师（默认 '未知'）
/// - [submitDate] 可选，提交时间（默认当前时间）
String generateReport({
  required String studentName,
  required String experimentTitle,
  required int score,
  String? className,
  String? teacher,
  DateTime? submitDate,
}) {
  final cls = className ?? '未填写'; // ?? 给默认值
  final tchr = teacher ?? '未知';
  final date = submitDate ?? DateTime.now();
  return '实验报告\n'
      '学生：$studentName（$cls）\n'
      '实验：$experimentTitle\n'
      '成绩：$score\n'
      '指导教师：$tchr\n'
      '提交时间：$date';
}

void reportGeneratorDemo() {
  print('--- 任务2：命名参数设计 ---');

  // 调用一：仅给三个 required，其余取默认值
  print('调用一（仅必填）：');
  print(generateReport(
    studentName: '李华',
    experimentTitle: 'Dart 语言基础',
    score: 95,
  ));

  print('');

  // 调用二：补一个可选参数 className
  print('调用二（加班级）：');
  print(generateReport(
    studentName: '张三',
    experimentTitle: '空安全改写',
    score: 88,
    className: '2 班',
  ));

  print('');

  // 调用三：给出全部参数（含可选）
  print('调用三（全参数）：');
  print(generateReport(
    studentName: '王五',
    experimentTitle: '函数与控制流',
    score: 76,
    className: '1 班',
    teacher: '赵老师',
    submitDate: DateTime(2026, 9, 24),
  ));
}

void main() => reportGeneratorDemo();
