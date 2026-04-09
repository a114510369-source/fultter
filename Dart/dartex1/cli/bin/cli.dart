import 'dart:io';

// 定義版本常數
const version = '0.0.1';

void main(List<String> arguments) {
  // 1. 判斷是否沒有輸入參數，或是輸入 help
  if (arguments.isEmpty || arguments.first == 'help') {
    printUsage();
  }
  // 2. 判斷是否輸入 version
  else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  }
  // 3. 判斷是否輸入 search
  else if (arguments.first == 'search') {
    // 使用三元判斷式：如果參數大於一個，取第一個之後的所有參數；否則給 null
    final inputArgs = arguments.length > 1 ? arguments.sublist(1) : null;
    searchWikipedia(inputArgs);
  }
  // 4. 其他未定義的指令
  else {
    printUsage();
  }
}

/// 查詢維基百科的函式
void searchWikipedia(List<String>? arguments) {
  final String articleTitle;

  // 判斷是否沒有傳入查詢關鍵字
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');

    // 互動式輸入：等待使用者在終端機輸入
    stdout.write('Enter article title: '); // 提示輸入
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    // 將 List 中的字串用空白結合起來
    articleTitle = arguments.join(' ');
  }

  // 模擬查詢過程
  print('Looking up articles about "$articleTitle". Please wait.');
  print('Here you go!');
  print('Current article title: $articleTitle');
}

/// 印出使用說明的函式
void printUsage() {
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'",
  );
}
