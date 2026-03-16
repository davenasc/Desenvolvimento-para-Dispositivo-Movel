class Laptop {
  int id;
  String nome;
  int ram;
  double clockCpu;

  Laptop(this.id, this.nome, this.ram, this.clockCpu);

  void mostrarInformacoes() {
    print("ID: $id");
    print("Modelo: $nome");
    print("Memória RAM: ${ram}GB");
    print("Clock da CPU: ${clockCpu}GHz");
  }
}

void main() {
  var laptop1 = Laptop(1, "Asus Vivobook S14", 16, 3.8);
  var laptop2 = Laptop(2, "MacBook Air M4", 16, 3.5);
  var laptop3 = Laptop(3, "Asus Rog Zephyrus", 32, 5.2);

  laptop1.mostrarInformacoes();
  print("-----------------------------------------");
  laptop2.mostrarInformacoes();
  print("-----------------------------------------");
  laptop3.mostrarInformacoes();
  print("-----------------------------------------");
}
