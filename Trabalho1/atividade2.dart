void main() {
  print("--- Sistema de Cadastro de Funcionários ---\n");

  cadastrarFuncionario(nome: "Ana", cargo: "Analista");

  cadastrarFuncionario(nome: "Carlos");

  cadastrarFuncionario(nome: "David", cargo: "Desenvolvedor");
}

void cadastrarFuncionario({required String nome, String? cargo}) {
  if (cargo != null) {
    print("Bem-vinda(o), $nome! Seu cargo é: $cargo.");
  } else {
    print("Bem-vinda(o), $nome!");
  }
}
