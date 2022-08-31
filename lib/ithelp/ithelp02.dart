import 'dart:io';

main() {
  var year = int.parse(stdin.readLineSync() ?? '0');
  var scoreList = <int>[60, 70, 30, 40, 70, 99, 100];
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  for (final score in scoreList) {
    print(score);
  }

  // for (int month = 1; month <= 12; month++) {
  //   print(month);
  // }

  while (year < 2016) {
    year += 1;
  }
}
