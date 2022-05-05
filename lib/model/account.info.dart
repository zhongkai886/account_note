import 'package:hive/hive.dart';

part 'account.info.g.dart';

@HiveType(typeId: 0)
class AccountInfo extends HiveObject {
  // AccountInfo({this.name, this.createDate, this.account, this.password, this.lable});

  @HiveField(0)
  String name = '';

  @HiveField(1)
  DateTime? createDate;

  @HiveField(2)
  String account = '';

  @HiveField(3)
  String password = '';

  @HiveField(4)
  String lable = '';
}
