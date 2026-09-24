# 独立研究笔记（选做）

以手工编程 + 官方文档（dart.dev/language）检索为主，记录探索过程与结论。

---

## 实验① const 与 final 差异

**问题**：`const` 与 `final` 都表示「不可变」，区别在哪？

**探索过程**：
1. 尝试用 `const` 接收运行时值：`const x = DateTime.now();`
   - `dart analyze` 报两条 error：
     - `Const variables must be initialized with a constant value.`
     - `The constructor being called isn't a const constructor.`
2. 改用 `final`：`final y = DateTime.now();` → 无 error，可运行。

**结论**：
- `const` 是**编译期常量**：值必须在编译时就能确定（字面量、const 构造、常量表达式），`DateTime.now()` 是运行时值，不能用于 const。
- `final` 是**运行时常量**：运行时确定一次、之后不可变，可接收 `DateTime.now()`。
- 官方语义：`const` 隐式 `final`，但反之不成立。

---

## 实验② 类型提升规则验证

**问题**：可空变量在 `if` 判空后，能否直接当非空用（免 `!`）？

**探索过程**（`bin/06_独立研究/type_promotion.dart`）：
```dart
String? name = readName();   // 运行时来源，分析器无法确定是否为 null
if (name != null) {
  print(name.length);        // 直接 .length，不加 !
}
```
- `dart analyze`：No issues found! 未提示 `!` 多余或缺失。
- `dart run`：输出 `name.length = 2 （无需 !）`。

**结论**：
- Dart 的**类型提升（type promotion）**：局部可空变量在 `if (x != null)` 分支内被自动提升为非空类型，可直接调用方法，无需 `!`。
- 反之，若未判空就用 `!`，分析器对「赋值后确知非空」的局部变量会报 `unnecessary_non_null_assertion`（本次案例复现中即因此改用 Map 查表演示 `!`）。
- 边界：类型提升只对**局部变量**生效，对实例字段不提升（字段可能被并发修改）。

---

## 实验③ dart format 规范实践

**问题**：`dart format` 对代码风格做了哪些规范化？

**探索过程**：
1. 手写一份故意凌乱的代码：
   ```dart
   void messy( int a , int b ){
   int  c=a+b;
   if(c>  0){print(  c );}else{print(  -c );}
   }
   void main(){messy( 3,4 );messy(-2 ,5 );}
   ```
2. 运行 `dart format`，diff 对比。

**格式化后**：
```dart
void messy(int a, int b) {
  int c = a + b;
  if (c > 0) {
    print(c);
  } else {
    print(-c);
  }
}

void main() {
  messy(3, 4);
  messy(-2, 5);
}
```

**结论**（`dart format` 规范项）：
- 函数名与 `(` 间无空格，参数间单空格；`=` / `<` / `>` 两侧补空格。
- 统一 2 空格缩进。
- `if/else` 单行体自动展开为多行花括号块。
- 顶层函数间空一行。
- 移除多余空白（`int  c` → `int c`）。

> 三项实验均以 `dart analyze` / `dart run` 实测验证，未直接采用 AI 生成的结论。
