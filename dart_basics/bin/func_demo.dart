// func_demo.dart：函数声明、箭头函数、命名参数与默认值
// 对应实践指南第三章「函数」

/// 普通函数声明。
int add(int a, int b) {
  return a + b;
}

/// 箭头函数：单表达式简写。
int add2(int a, int b) => a + b;

/// 命名参数：Flutter 组件构造函数的统一风格。
/// required 标记必填，其余可缺省或给默认值。
void enroll({required String name, int age = 18, String? className}) {
  print('enroll -> name: $name, age: $age, className: ${className ?? '未填写'}');
}

void funcDemo() {
  print('--- 函数：普通声明与箭头 ---');
  print('add(2, 3) = ${add(2, 3)}');
  print('add2(2, 3) = ${add2(2, 3)}');

  print('--- 命名参数 ---');
  enroll(name: '李华', className: '2班'); // 必填 name 给出，age 取默认值
  enroll(name: '张三', age: 20, className: '1班');
}
