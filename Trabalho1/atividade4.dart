class Laptop {
  int id;
  String nome;
  int ram;
  double clockCpu;

  Laptop(this.id, this.nome, this.ram, this.clockCpu);

  // Named Constructor 1: Navegação na internet
  Laptop.internet(this.id, this.nome) : ram = 8, clockCpu = 1.8;

  // Named Constructor 2: Escritório
  Laptop.escritorio(this.id, this.nome) : ram = 16, clockCpu = 2.5;

  // Named Constructor 3: Programação
  Laptop.programacao(this.id, this.nome) : ram = 32, clockCpu = 3.8;

  void mostrarInformacoes() {
    print("ID: $id");
    print("Modelo: $nome");
    print("Memória RAM: ${ram}GB");
    print("Clock da CPU: ${clockCpu}GHz");
  }
}

void main() {
  var pcInternet = Laptop.internet(1, "Chromebook");
  var pcEscritorio = Laptop.escritorio(2, "Dell Latitude");
  var pcDev = Laptop.programacao(3, "MacBook Pro M3 Pro");

  pcInternet.mostrarInformacoes();
  print("-----------------------------------------");
  pcEscritorio.mostrarInformacoes();
  print("-----------------------------------------");
  pcDev.mostrarInformacoes();
  print("-----------------------------------------");
}
