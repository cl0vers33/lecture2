// const_final.dart：独立研究①const 与 final 差异（可运行演示）
// 说明：`const x = DateTime.now();` 会编译报错（非编译期常量），
//   故此处以注释保留对照，下面仅演示可运行的 final。
//   完整对照见同目录 notes.md。

void main() {
  // final：运行时确定一次，可接收 DateTime.now()
  final now = DateTime.now(); // OK
  print('final now = $now （运行时确定）');

  // const：编译期常量，只能接字面量/const 表达式
  const pi = 3.14159; // OK：字面量
  print('const pi = $pi （编译期确定）');

  // 以下行若取消注释会编译报错：
  //   error: Const variables must be initialized with a constant value.
  //   error: The constructor being called isn't a const constructor.
  // const x = DateTime.now(); // ← DateTime.now() 非编译期常量
}
