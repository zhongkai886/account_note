import 'piloted.dart';
import 'package:flutter_account_note/ithelp04/spacecraft.dart';

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(String name, DateTime? launchDate) : super(name, launchDate);

}