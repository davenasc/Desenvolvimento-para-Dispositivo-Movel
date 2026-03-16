import 'dart:io';

class House {
  int id;
  String name;
  double price;

  House(this.id, this.name, this.price);
}

void main() {
  List<House> houses = [];

  for (var i = 1; i <= 3; i++) {
    stdout.write("Digite o ID da casa $i: ");
    int id = int.parse(stdin.readLineSync()!);

    stdout.write("Digite o nome: ");
    String name = stdin.readLineSync()!;

    stdout.write("Digite o preço: ");
    double price = double.parse(stdin.readLineSync()!);

    houses.add(House(id, name, price));
    print("---------------------------------");
  }

  for (var i = 0; i < houses.length; i++) {
    houses[i]..name = "${houses[i].name} (Cadastrada)";
  }

  print("\n=== casas cadastradas ===");

  for (var house in houses) {
    print(
      "ID: ${house.id} | Nome: ${house.name} | Preço: R\$ ${house.price.toString()}",
    );
  }
}
