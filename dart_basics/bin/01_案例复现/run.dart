// run.dart：01 案例复现独立运行入口（也可用包默认 `dart run` 运行 bin/dart_basics.dart）
import 'types_demo.dart';
import 'func_demo.dart';
import 'flow_demo.dart';

void main() {
  print('===== Dart 基础语法合集 =====');

  variableDemo();
  print('');
  interpolationDemo();
  print('');
  nullSafetyDemo();
  print('');
  funcDemo();
  print('');
  flowDemo();

  print('===== 全部输出结束 =====');
}
