// practice_main.dart：自主实践入口，统一调用三个任务并输出
import 'null_safety_rewrite.dart';
import 'report_generator.dart';
import 'grade_classifier.dart';

void main() {
  print('===== 自主实践 =====');
  nullSafetyRewriteDemo();
  print('');
  reportGeneratorDemo();
  print('');
  gradeClassifierDemo();
  print('===== 自主实践结束 =====');
}
