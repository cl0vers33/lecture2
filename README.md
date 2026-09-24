# lecture2 · Dart 语言基础一（变量、类型、函数与控制流）

移动应用开发实践 · 第 2 课（第 4 周）作业仓库。

## 目录结构

```
lecture2/
├── README.md                 # 本文件
├── progress.md               # 进度报告二（十节）
└── dart_basics/              # 课堂案例复现 + 自主实践 + 独立研究
    ├── bin/
    │   ├── dart_basics.dart   # 入口：统一调用三组示例
    │   ├── types_demo.dart    # 变量、插值、空安全四件套
    │   ├── func_demo.dart     # 函数声明、箭头、命名参数
    │   ├── flow_demo.dart     # 运算符、分支、for-in 循环
    │   ├── practice/          # 自主实践三任务
    │   │   ├── null_safety_rewrite.dart   # 任务1：空安全改写
    │   │   ├── report_generator.dart      # 任务2：命名参数设计
    │   │   ├── grade_classifier.dart      # 任务3：成绩分级器扩展
    │   │   └── practice_main.dart         # 自主实践入口
    │   └── research/          # 独立研究（选做）
    │       └── research.dart  # 类型提升实验
    ├── ai_quiz_round1.md      # TraeCode 对拍记录（5 题）
    ├── research_notes.md      # 独立研究笔记（const/final、类型提升、format）
    └── pubspec.yaml
```

## 运行

```bash
cd dart_basics
dart run                            # 课堂案例复现（四组示例）
dart run bin/practice/practice_main.dart   # 自主实践三任务
dart run bin/research/research.dart        # 独立研究：类型提升
dart analyze                        # 检查点：无告警
```

## 环境要求

- Dart SDK 3.13.2（stable）
- Git 2.55

## Git 提交

1. `feat: dart create dart_basics` —— 创建纯 Dart 工程
2. `feat: types/func/flow demos all pass` —— 四组示例填充并通过
3. `docs: ai quiz round 1 records` —— TraeCode 对拍记录
4. 自主实践与独立研究
