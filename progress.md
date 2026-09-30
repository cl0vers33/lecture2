# 进度报告 2（第 4 周 · Dart 语言基础一）

## 一、任务理解

本次作业要完成 Dart 语言基础的第一个单元实践，核心是「能读懂、能写出、能解释」基础 Dart 程序。具体包括三部分：

1. **案例复现**：跟随实践指南复现课堂案例 `dart_basics`，代码与指南一致、可运行、按步骤 Git 提交（3 次提交）。
2. **自主实践基本要求**：① 空安全改写（把含隐患的可空代码改为安全版本并逐处解释）；② 命名参数设计（为「实验报告生成器」设计函数签名并给出三种调用）；③ 控制流小程序（成绩分级器扩展，处理边界 100/0 与非法输入）；④ TraeCode 对拍一组记录；⑤ AI 使用标注。
3. **独立研究任务（选做）**：const 与 final 差异实验、类型提升规则验证、dart format 规范实践，以手工编程 + 官方文档检索为主。

**验收标准**：`dart run` 全部输出正确且无编译告警；空安全无告警；仓库含 README 与进度报告；Git 提交 ≥ 3 次；进度报告十节填写完整并复制到雨课堂答题区。

## 二、环境与工具

- 操作系统：Windows
- Dart SDK：3.13.2（stable，windows_x64）
- Git：2.55.0.windows.5
- 开发工具：TraeCode（IDE，内置终端）
- 运行目标：本地控制台（纯 Dart 控制台程序，无 Web/模拟器/真机需求）
- AI 工具：TraeCode 内置 AI 助手（GLM-5.2），用于出题、参考答案生成与代码生成辅助

## 三、过程记录

1. **环境检查**：在 TraeCode 终端执行 `dart --version` 与 `git --version`，确认 Dart 3.13.2、Git 2.55 可用。
2. **建仓与建工程**：在 `课程2/lecture2` 下 `git init`，执行 `dart create dart_basics` 生成控制台模板（含 `bin/dart_basics.dart` 入口、`pubspec.yaml`、`analysis_options.yaml` 等）。
3. **步骤一提交**：暂存模板文件，提交 `feat: dart create dart_basics`。
4. **步骤二填充四组示例**：在 `bin/` 下新建 `types_demo.dart`（变量/插值/空安全四件套）、`func_demo.dart`（命名参数 enroll + 箭头函数）、`flow_demo.dart`（gradeOf 分级器 + for-in），改写 `dart_basics.dart` 入口统一调用。
5. **修正空安全告警**：首版 `dart analyze` 报 2 条告警（死代码 + `!` 多余），根因是类型提升。改用「参数化可空值 + Map 查表」演示 `?.`/`??`/`!`，告警清零。
6. **步骤二提交**：`feat: types/func/flow demos all pass`，`dart run` 全部输出正确。
7. **步骤三对拍**：让 TraeCode 出 5 道「预测输出」题（空安全、命名参数、整除），先手写答案再对照参考答案，Q4/Q5 出现分歧并纠正。提交 `docs: ai quiz round 1 records`。
8. **自主实践**：在 `bin/02_空安全改写/`、`bin/03_命名参数设计/`、`bin/04_成绩分级器/` 三文件夹分别完成空安全改写、报告生成器（命名参数）、成绩分级器扩展，各文件含独立 `main`，分别 `dart run` 通过。
9. **独立研究（选做）**：在 `bin/06_独立研究/` 下做 const/final、类型提升、dart format 三实验，实测验证并记录于 `notes.md`。
10. **仓库收尾**：补 `README.md` 与本进度报告，提交自主实践与文档。

## 四、关键代码

> 以下代码均为 AI 辅助生成 + 本人逐行验证（手工核对语义、`dart analyze`/`dart run` 实测）。

### 关键代码 1：空安全四件套（`bin/01_案例复现/types_demo.dart`，节选）

```dart
void demonstrateNullable(String? nickname) {
  print('nickname = $nickname');
  print('  ?.length = ${nickname?.length}'); // null 则短路返回 null
  print('  ?? 默认 = ${nickname ?? '未填写'}'); // null 则取默认值
}

void nullSafetyDemo() {
  demonstrateNullable(null);  // 演示 null 分支
  demonstrateNullable('hu');  // 演示非空分支

  final Map<String, String> students = {'001': '李华'};
  final String name001 = students['001']!; // Map 查表返回 String?，! 真正必要
  print('students[001]! = $name001');

  late String token;
  token = 'abc-123'; // late：承诺使用前必赋值
  print('late token = $token');
}
```

逐行解释：
- `String? nickname`：可空类型形参，分析器无法确定运行时值，故 `?.length` 不会被判死代码。
- `nickname?.length`：安全调用，null 则短路返回 null，不抛错。
- `nickname ?? '未填写'`：空默认，左侧为 null 取右侧。
- `students['001']!`：Map 查表恒返回 `String?`，分析器无法类型提升，`!` 在此真正必要（非多余）。
- `late String token`：延迟初始化，承诺使用前必赋值。

### 关键代码 2：命名参数设计（`bin/03_命名参数设计/report_generator.dart`，节选）

```dart
String generateReport({
  required String studentName,
  required String experimentTitle,
  required int score,
  String? className,
  String? teacher,
  DateTime? submitDate,
}) {
  final cls = className ?? '未填写';
  final tchr = teacher ?? '未知';
  final date = submitDate ?? DateTime.now();
  return '实验报告\n学生：$studentName（$cls）\n…提交时间：$date';
}
```

逐行解释：
- `{required ...}`：花括号表命名参数，Flutter 组件构造风格；`required` 标必填。
- `String? className`：可空可选参数；`??` 给默认值。
- 三种调用：①仅必填；②加 `className:`；③全参数（含 `teacher:`、`submitDate:`）。

### 关键代码 3：成绩分级器扩展（`bin/04_成绩分级器/grade_classifier.dart`）

```dart
String gradeOf(int score) {
  if (score < 0 || score > 100) return '非法输入'; // 先拦截非法
  if (score == 100) return '满分';                   // 边界 100
  if (score >= 90) return '优';
  if (score >= 80) return '良';
  if (score >= 60) return '中';
  if (score > 0) return '不及格';
  return '零分'; // 走到这里 score == 0
}
```

逐行解释：先用 `< 0 || > 100` 拦非法（条件必须是 bool），再判 100 满分与 0 零分边界，其余分级。`dart run` 用 `[-5,0,40,60,80,90,99,100,150]` 验证全部正确。

## 五、检查点结果

- **`dart run` 全部输出正确**：四组示例（变量/插值/空安全/函数/控制流）输出与预期一致（见第八节证据）。
- **空安全无编译告警**：`dart analyze` 输出 `No issues found!`（首版曾有 2 条告警，已在「问题与调试」解决）。
- **自主实践可运行**：`02/03/04` 三文件夹各含独立 `main`，分别 `dart run` 全部输出正确。
- **能口头解释 `??` 与 `!` 的区别**：`??` 是「左侧为 null 时取默认值」，不抛错；`!` 是「断言非 null，为 null 则抛运行时异常」，慎用。

## 六、问题与调试

**真实记录：`dart analyze` 报两条告警**

- 现象：首版 `nullSafetyDemo` 写法 `String? nickname; print(nickname?.length); … nickname = 'hu'; print(nickname!.length);`，`dart analyze` 报：
  - `Dead code`（`?.length` 后的 `.length`）；
  - `unnecessary_non_null_assertion`（`nickname!.length` 的 `!` 多余）。
- 定位：查阅 Dart 官方文档「Type promotion」——局部可空变量未赋值时分析器确知为 null，`?.` 的成员访问被判死代码；赋值 `nickname = 'hu'` 后变量被类型提升为非空 `String`，再写 `!` 即多余。
- 解决：把可空值改为「函数形参」（分析器无法确定其值）来演示 `?.`/`??`，并用「Map 查表返回 `String?`」来演示 `!`（Map 查表结果无法被类型提升，`!` 真正必要）。重跑 `dart analyze` → `No issues found!`。
- 收获：`!` 不是「安全取值」而是「断言非空」，能不用就不用；类型提升会让局部判空后的 `!` 多余。

## 七、AI 使用记录（TraeCode 使用清单）

| 用途 | 指令摘要 | 输出 | 本人验证方式 |
| --- | --- | --- | --- |
| 案例代码生成 | 按指南要求生成 types/func/flow 三个 demo | 三份 dart 源文件 | 逐行读码 + `dart run` 核对输出 + `dart analyze` 零告警 |
| 空安全告警修复 | 说明告警根因并改写演示 | 改用参数+Map 查表写法 | `dart analyze` 由 2 告警 → 0 告警 |
| 对拍出题 | 指定范围（空安全/命名参数/整除）出 5 道预测输出题 | 5 题及参考答案 | 先手写答案再对照；Q4/Q5 分歧已纠正并实测 |
| 自主实践代码 | 生成空安全改写/报告生成器/分级器 | 三份 dart 源文件（各含独立 main） | 逐文件 `dart run` 输出核对 |
| 独立研究 | 仅检索官方文档语义，不直接生成结论 | `bin/06_独立研究/notes.md` | `dart analyze`/`dart run`/`dart format` 实测验证 |

红线遵守：所有 AI 生成代码均经 `dart analyze` + `dart run` 实测验证后再提交；独立研究结论以官方文档为准、未直接采信 AI 结论。

## 八、证据截图

> 以下为控制台输出与 Git 记录的文本证据（雨课堂不支持粘贴图片时，直接用以下文本作为证据；本报告不另行插入图片）。

**证据 1：`dart run` 课堂案例输出（节选关键行）**
```
===== Dart 基础语法合集 =====
--- 空安全四件套 ---
nickname = null
  ?.length = null
  ?? 默认 = 未填写
nickname = hu
  ?.length = 2
  ?? 默认 = hu
students[001]! = 李华
late token = abc-123
--- 运算符：整除 ~/ 与除法 / ---
7 / 2 = 3.5
7 ~/ 2 = 3
===== 全部输出结束 =====
```
一句话说明：四组示例全部按预期输出，`?.` 短路返回 null、`~/` 整除为 3、`/` 为 3.5。

**证据 2：`dart analyze` 零告警**
```
Analyzing dart_basics...
No issues found!
```
一句话说明：空安全无编译告警，检查点通过。

**证据 3：Git 提交记录（6 次提交）**
```
1afd2db refactor: split each task into its own folder (01-06)
a013404 docs: progress report (10 sections)
c9d2a2c feat: autonomous practice + independent research + README
0b39502 docs: ai quiz round 1 records
4648c44 feat: types/func/flow demos all pass
526d631 feat: dart create dart_basics
```
一句话说明：按指南三步提交 + 自主实践 + 报告 + 按任务拆分重组，共 6 次语义化提交，满足「≥3 次提交」。

**证据 4：自主实践三任务运行（节选）**
```
=== 04 成绩分级器 ===
-5 分 -> 非法输入
0 分 -> 零分
40 分 -> 不及格
60 分 -> 中
80 分 -> 良
90 分 -> 优
100 分 -> 满分
150 分 -> 非法输入
```
一句话说明：成绩分级器边界 100/0 与非法输入 -5/150 均正确分类。

## 九、自评

对照本次作业要求逐项自查：

- 案例复现 `dart_basics`：✅ 代码与指南一致、可运行、3 次 Git 提交。
- 检查点：✅ `dart run` 全部输出正确；`dart analyze` 无告警。
- Git 规范：✅ 6 次语义化提交（feat/docs/refactor）。
- 报告记录：✅ 十节齐全。
- 自主实践①空安全改写：✅ 隐患版对照 + 安全版逐处解释。
- 自主实践②命名参数设计：✅ required + 可选 + 默认值，三种调用。
- 自主实践③成绩分级器：✅ 处理 100/0 与非法输入。
- 自主实践④TraeCode 对拍：✅ 5 题，2 题分歧已纠正。
- 自主实践⑤AI 使用标注：✅ 见第七节。
- 独立研究（选做）：✅ 三实验均有实测验证。
- 提交要求：✅ 进度报告存于 `lecture2/progress.md`，仓库含 README，独立仓库 lecture2。

## 十、一句话收获与下一步计划

- **一句话收获**：Dart 的空安全四件套中，`?.`/`??` 是「安全」的，`!` 是「断言」、为 null 必抛错——能用 `?.`/`??`/类型提升就不要用 `!`。
- **遗留问题**：对实例字段不触发类型提升的边界场景尚未深入实验。
- **下次课预习要点**：集合（List/Map/Set）与回调函数（函数作为一等公民传递），为 Flutter 组件构造做铺垫。
