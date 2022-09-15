String? name;
// String age;
late int height; //需要確保在使用之前會初始化 也就是有內容
main() {
  // final const
  // const a = readThermometer();
  final b = readThermometer();

  // var c = a * b;
  // print(c);

  // //sample1
  // print(name);

  // //sample2
  // print(name.length);

  // //sample2-1
  // print(name!.length);

  // //sample2-2
  // print((name?.length));

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
  const thermometer = '100F';
  return thermometer;
}
