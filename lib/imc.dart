import 'dart:convert';
import 'dart:io';
import 'package:imc/helper.dart';
import 'package:imc/pessoa.dart';
import 'package:imc/retorno_imc.dart';

RetornoImc calculateImc(Pessoa pessoa) {
  double value = double.parse(
      (pessoa.peso / (pessoa.altura * pessoa.altura)).toStringAsFixed(2));

  if (value < 16) {
    return RetornoImc(
        msd:
            "Seu Imc  é ${value.toStringAsFixed(2)}, Classificação: Magreza Grave",
        imcResult: value);
  }
  if (value > 16 && value < 17) {
    return RetornoImc(
        msd:
            "Seu Imc  é ${value.toStringAsFixed(2)}, Classificação: Magreza Moderada",
        imcResult: value);
  }
  if (value > 17 && value < 18.5) {
    return RetornoImc(
        msd:
            "Seu Imc é ${value.toStringAsFixed(2)}, Classificação: Magreza Leve",
        imcResult: value);
  }
  if (value > 18.5 && value < 25) {
    return RetornoImc(
        msd: "Seu Imc é ${value.toStringAsFixed(2)}, Classificação: Saudável",
        imcResult: value);
  }
  if (value > 25 && value < 30) {
    return RetornoImc(
        msd: "Seu Imc é ${value.toStringAsFixed(2)}, Classificação: Sobrepeso",
        imcResult: value);
  }
  if (value > 30 && value < 35) {
    return RetornoImc(
        msd:
            "Seu Imc é ${value.toStringAsFixed(2)}, Classificação: Obesidade Grau I",
        imcResult: value);
  }
  if (value > 35 && value < 40) {
    return RetornoImc(
        msd:
            "Seu Imc é ${value.toStringAsFixed(2)}, Classificação: Obesidade Grau II (Severa)",
        imcResult: value);
  } else if (value >= 40) {
    return RetornoImc(
        msd:
            "Seu Imc é ${value.toStringAsFixed(2)}, Classificação: Obesidade Grau III (Mórbida)",
        imcResult: value);
  }
  return RetornoImc(
      msd:
          "Seu Imc é ${value.toStringAsFixed(2)}, Classificação: Obesidade Grau III (Mórbida)",
      imcResult: value);
}

String validateImc(Pessoa pessoa) {
  if (pessoa.peso == 0 || pessoa.altura == 0) {
    return "${pessoa.nome}, alguma informção importante deixou de ser passada, poderia verificar!";
  }

  print(calculateImc(pessoa).msd);
  return calculateImc(pessoa).msd;
}

setAluno() {
  String? nome;
  String? altura;
  String? peso;

  Pessoa aluno = Pessoa(altura: 0, peso: 0, nome: "ALUNO");
  print("Olá, Como é o seu nome? ");
  nome = stdin.readLineSync(encoding: utf8)!;
  print("Ótimo $nome, Que tal Calcularmos o seu IMC! \n");

  print("Primeiramente $nome, Me fala seu peso! ");
  peso = stdin.readLineSync(encoding: utf8)!;
  print("Ótimo $nome, Agroa so mais uma coisa!\n");

  print("$nome, Agroa me fala sua altura!");
  altura = Helper().doubleGreat(stdin.readLineSync(encoding: utf8)!).toString();

  print("Ótimo $nome, Agroa so calcular... \n");

  print("Baseado nos seus dados:");

  return validateImc(Pessoa(
      altura: double.parse(altura.isEmpty ? aluno.altura.toString() : altura),
      peso: double.parse(altura.isEmpty ? aluno.peso.toString() : peso),
      nome: nome.isEmpty ? aluno.nome : nome));
}
