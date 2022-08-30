import 'package:flutter_account_note/ithelp04/pilotedCraft.dart';
import 'package:flutter_account_note/ithelp04/spacecraft.dart';

class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(this.altitude) : super('test1', DateTime(100));
}

main() {
  // sample3
  var  pilotedCraft = PilotedCraft('zhongkai',DateTime(1999,03,14));
  print(pilotedCraft.astronauts);
  
  pilotedCraft.describe();

  pilotedCraft.describeCrew();

  
  // sample2
  
  // var qrbiter = Orbiter(100.0);
  // print(qrbiter.altitude);
  // qrbiter.describe();

  // sample1
  
  // var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  // voyager.describe();

  // var voyager3 = Spacecraft.unlaunched('Voyager III');
  // voyager3.describe();
}
