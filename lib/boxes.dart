import 'package:flutter_todo/model/account.info.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<AccountInfo> getUserInfos() => Hive.box<AccountInfo>('accountInfos');
}
