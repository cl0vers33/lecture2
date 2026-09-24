// research.dart：独立研究（选做）实验代码
// 三个实验：① const 与 final 差异  ② 类型提升规则  ③ dart format 规范
// 说明：以手工编程 + 官方文档（dart.dev/language）为主，结论见 research_notes.md。

void main() {
  // ② 类型提升规则验证：可空变量在 if 判空后，可直接当非空用，无需 !
  print('--- 实验②：类型提升 ---');
  String? name = readName(); // 运行时来源，分析器无法确定是否为 null
  if (name != null) {
    // 此处 name 已被「类型提升」为非空 String，可直接 .length
    print('name.length = ${name.length} （无需 !）');
  } else {
    print('name 为 null');
  }
}

// 模拟运行时来源的可空值
String? readName() => 'hu';

// ① const 与 final 差异：见下方注释与 research_notes.md
// const x = DateTime.now(); // 编译错误：DateTime.now() 非编译期常量
// final y = DateTime.now(); // OK：运行时确定一次
