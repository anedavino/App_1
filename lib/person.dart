class Person {
  int id;
  String name;
  String idade;
  String email;
  Person({this.id, this.name, this.idade, this.email});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      id: json["id"],
      name: json["name"],
      idade: json["idade"],
      email: json["email"]
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'idade': idade, 'email': email,};
  }
}
