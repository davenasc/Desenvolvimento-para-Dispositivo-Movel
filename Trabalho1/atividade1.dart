void main() {
  var nome = "Impressora 3D";

  String local = "Lab de Protótipos";

  //ao contrário do var e do string, o tipo dynamic não fixa o tipo da variável,
  //  podendo ser alterada depois.
  dynamic patrimonio = 12345;

  patrimonio = "12345-A";

  print("--- Sistema de Cadastro de Equipamentos - IFSP ---");

  print("Equipamento: $nome, tipo String: ${nome is String}");

  print("\nLocal: $local, tipo String: ${local is String}");

  print(
    "\nPatrimônio: $patrimonio, tipo Int: ${patrimonio is int}, tipo String: ${patrimonio is String}",
  );
}
