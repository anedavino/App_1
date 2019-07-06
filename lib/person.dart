class Person {
  int id;
  String name;
  String idade;
  String endereco;
  Person({this.id, this.name, this.idade});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json["id"],
      name: json["name"],
      idade: json["idade"],
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'idade': idade};
  }
}
