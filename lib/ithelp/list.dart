class Pokemon {
  String name;
  String attributes;
  Pokemon({required this.name, required this.attributes});
}

var pokemons = [
  '0',
  100,
  false,
  Pokemon(name: '小火龍', attributes: '火系'),
];

List<String> students = ['Kenny', 'Andy', 'Judy'];
List<String> students2 = ['A', 'B', 'C'];
List<String>? ghostStudent;
main() {
  // List<String> aClass = [...students2, ...students];
  // print(aClass);

  // var bClass = students + students2;
  // print(bClass);
  // for (var s in pokemons) {
  //   print(s);
  // }
  // ghostStudent = ['A', 'B', 'C'];
  var list2 = ['XDD', ...?ghostStudent];
  print(list2);
}
