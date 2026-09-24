// dart_basics.dart：入口，统一调用三组示例并输出
// 对应实践指南第五章「课堂案例复现」步骤二

import '01_案例复现/types_demo.dart';
import '01_案例复现/func_demo.dart';
import '01_案例复现/flow_demo.dart';

void main(List<String> arguments) {
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
