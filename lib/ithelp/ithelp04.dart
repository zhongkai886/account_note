String? name;
// String age;
late int height; //需要確保在使用之前會初始化 也就是有內容
main() {
  // //sample1
  // print(name);

  // //sample2
  // print(name.length);

  // //sample2-1
  // print(name!.length);

  // //sample2-2
  print((name?.length));

  //sample3
  // height = 173;
  // print(height);

  //sample4
  // late String temperature = readThermometer(); // Lazily initialized.
  // print(temperature);

  //sample5
  // final gender = 'female'; //不需特別設置型態
  // gender = 'male'; //X 不可修改
  // print(gender);
}

//sample4
String readThermometer() {
  print('test');
  return '39F';
}
