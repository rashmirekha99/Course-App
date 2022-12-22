void main() {
  var name = "Rashmi";
  print(name);

  var animals = <String>['cat', 'dog', 'cow', '23'];
  print(animals);

  void nameOut(String name) {
    print(name);
  }

  nameOut("Rashmi");

  void data({required String n, required int age}) {
    print(n);
  }

  data(n: "Rashmi",age:13);
}
