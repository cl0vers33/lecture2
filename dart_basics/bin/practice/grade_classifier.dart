// grade_classifier.dart：任务3·成绩分级器扩展
// 在指南 gradeOf 基础上扩展：处理边界 100/0 与非法输入。

/// 成绩分级器（扩展版）。
///
/// 边界与非法处理：
/// - 负数或 >100 → '非法输入'
/// - 100 → '满分'
/// - 0 → '零分'
/// - 其余按 优/良/中/不及格
String gradeOf(int score) {
  // 先拦截非法输入，条件必须是 bool
  if (score < 0 || score > 100) return '非法输入';
  if (score == 100) return '满分';
  if (score >= 90) return '优';
  if (score >= 80) return '良';
  if (score >= 60) return '中';
  if (score > 0) return '不及格';
  return '零分'; // 走到这里说明 score == 0
}

void gradeClassifierDemo() {
  print('--- 任务3：成绩分级器扩展 ---');
  // 边界与非法用例
  final cases = [-5, 0, 40, 60, 80, 90, 99, 100, 150];
  for (final s in cases) {
    print('$s 分 -> ${gradeOf(s)}');
  }
}
