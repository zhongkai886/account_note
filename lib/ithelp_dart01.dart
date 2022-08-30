var name = 'Voyager I';
var year = 1977;
var antennaDiameter = 3.7;
var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg'
};

void main() {
  print(name);
  print(year);
  print(antennaDiameter);
  print(flybyObjects[1]);
  print(image['tags']);
}
