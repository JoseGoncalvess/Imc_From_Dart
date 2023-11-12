import 'package:imc/pessoa.dart';
import 'package:test/test.dart';
import 'package:imc/imc.dart' as imc;

void main() {
  test('Calcucar valores normais', () {
    expect(imc.calculateImc(Pessoa(altura: 1.81, peso: 89, nome: "ALUNO")).msd,
        equals('Seu Imc é 27.17, Classificação: Sobrepeso'));

    expect(
        imc
            .calculateImc(Pessoa(altura: 1.81, peso: 89, nome: "ALUNO"))
            .imcResult,
        equals(27.17));
  });

  test("passado aluno com valores zerados", () {
    Pessoa aluno = Pessoa(altura: 1.81, peso: 0, nome: "Paulo");
    Pessoa aluna = Pessoa(altura: 0, peso: 0, nome: "Anny");
    expect(
        imc.validateImc(aluno),
        equals(
            "${aluno.nome}, alguma informção importante deixou de ser passada, poderia verificar!"));
    expect(
        imc.validateImc(aluna),
        equals(
            "${aluna.nome}, alguma informção importante deixou de ser passada, poderia verificar!"));
  });

  test("Passando o valores sem vigula", () {
    Pessoa aluna = Pessoa(altura: 1.68, peso: 68, nome: "Maria");

    expect(
        imc.validateImc(aluna),
        equals(
            "Seu Imc é ${imc.calculateImc(aluna).imcResult}, Classificação: Saudável"));
  });
}
