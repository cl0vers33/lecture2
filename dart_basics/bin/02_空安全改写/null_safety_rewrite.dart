// null_safety_rewrite.dart：任务1·空安全改写
// 将含隐患的可空代码改为安全版本并逐处解释。

// ====================== 隐患版（不要运行，仅对照）======================
// 以下代码存在多处空安全隐患，按指南「翻车点」列示：
//
// String name;                       // 隐患①：非空变量未初始化即使用
// String? nickname;                  // 可空，可能为 null
// void greetBad() {
//   print(name.length);              // 隐患②：name 未初始化，运行抛 LateInitializationError
//   print(nickname!.length);         // 隐患③：! 用在可能为 null 的值上，运行抛错
//   if (nickname) {                  // 隐患④：字符串当布尔，编译错误
//     print(nickname);
//   }
// }
//
// 调用 greetBad() 会：编译期报「字符串不能当布尔」错；
// 即便去掉 if 行，运行期 nickname! 仍会抛 Null check operator used on null。

// ====================== 安全版 ======================
String name = '默认名'; // 修复①：非空变量声明时初始化

void greetSafe(String? nickname) {
  // nickname 形参为 String?，可能为 null
  print('name.length = ${name.length}'); // name 已初始化，安全

  // 修复③：把 ! 改为 ?. 安全调用——null 则短路返回 null，不再抛错
  print('nickname?.length = ${nickname?.length}');

  // 修复④：去掉 if (nickname) 的字符串当布尔写法，
  //   改为显式判空 if (nickname != null)（条件必须是 bool）
  if (nickname != null) {
    print('非空分支：nickname = $nickname');
  }

  // 补充：用 ?? 给默认值，避免后续用到 null
  print('nickname ?? 默认 = ${nickname ?? '未填写'}');
}

void nullSafetyRewriteDemo() {
  print('--- 任务1：空安全改写 ---');
  greetSafe(null); // 传 null，验证安全分支
  print('');
  greetSafe('hu'); // 传非空，验证非空分支
}

void main() => nullSafetyRewriteDemo();
