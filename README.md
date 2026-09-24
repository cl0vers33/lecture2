# lecture2 · Dart 语言基础一（变量、类型、函数与控制流）

移动应用开发实践 · 第 2 课（第 4 周）作业仓库。

## 目录结构

```
lecture2/
├── README.md                 # 本文件
├── progress.md               # 进度报告二（十节）
└── dart_basics/              # Dart 包（dart create 生成，pubspec 等保留）
    ├── bin/
    │   ├── dart_basics.dart          # 包入口：统一调用三组示例（默认 dart run）
    │   ├── 01_案例复现/              # 课堂案例复现（四组示例）
    │   │   ├── types_demo.dart       # 变量、插值、空安全四件套
    │   │   ├── func_demo.dart        # 函数声明、箭头、命名参数
    │   │   ├── flow_demo.dart       # 运算符、分支、for-in 循环
    │   │   └── run.dart             # 案例复现独立运行入口
    │   ├── 02_空安全改写/           # 自主实践①
    │   │   └── null_safety_rewrite.dart
    │   ├── 03_命名参数设计/         # 自主实践②
    │   │   └── report_generator.dart
    │   ├── 04_成绩分级器/           # 自主实践③
    │   │   └── grade_classifier.dart
    │   ├── 05_TraeCode对拍/         # 自主实践④
    │   │   └── ai_quiz_round1.md    # 5 题对拍记录
    │   └── 06_独立研究/             # 选做
    │       ├── const_final.dart     # const/final 差异
    │       ├── type_promotion.dart  # 类型提升
    │       └── notes.md             # 三实验笔记（含 dart format）
    └── pubspec.yaml
```

## 运行

```bash
cd dart_basics
dart run                                          # 01 案例复现（四组示例）
dart run "bin/02_空安全改写/null_safety_rewrite.dart"     # 02 空安全改写
dart run "bin/03_命名参数设计/report_generator.dart"     # 03 命名参数设计
dart run "bin/04_成绩分级器/grade_classifier.dart"       # 04 成绩分级器
dart run "bin/06_独立研究/const_final.dart"              # 06 const/final
dart run "bin/06_独立研究/type_promotion.dart"           # 06 类型提升
dart analyze                                      # 检查点：无告警
```

## 环境要求

- Dart SDK 3.13.2（stable）
- Git 2.55

## Git 提交

1. `feat: dart create dart_basics` —— 创建纯 Dart 工程
2. `feat: types/func/flow demos all pass` —— 四组示例填充并通过
3. `docs: ai quiz round 1 records` —— TraeCode 对拍记录
4. 自主实践与独立研究
