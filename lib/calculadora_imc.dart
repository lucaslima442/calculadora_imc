import 'dart:convert';
import 'dart:io' as io;

void executar() {
  CalculadoraIMC calculadora = CalculadoraIMC();
  double imc = calculadora.calcularIMC();
  print('Seu IMC é: ${imc.toStringAsFixed(2)}');
  print('Classificação: ${CalculadoraIMC.classificarIMC(imc)}');
}

class CalculadoraIMC {
  double calcularIMC({io.Stdin? stdin}) {
    double altura = _lerInf('Digite sua altura em metros: ', stdin: stdin);
    double peso = _lerInf('Digite seu peso em kg: ', stdin: stdin);
    return peso / (altura * altura);
  }

  static String classificarIMC(double imc) {
    if (imc < 16) {
      return 'Magreza grave';
    } else if (imc >= 16 && imc < 17) {
      return 'Magreza moderada';
    } else if (imc >= 17 && imc < 18.5) {
      return 'Magreza leve';
    } else if (imc >= 18.5 && imc < 25) {
      return 'Saudável';
    } else if (imc >= 25 && imc < 30) {
      return 'Sobrepeso';
    } else if (imc >= 30 && imc < 35) {
      return 'Obesidade Grau I';
    } else if (imc >= 35 && imc < 40) {
      return 'Obesidade Grau II (servera)';
    } else {
      return 'Obesidade Grau III (mórbida)';
    }
  }


  double _lerInf(String text, {io.Stdin? stdin}) {
    try {
      print(text);
      String? alturaStr = (stdin??io.stdin).readLineSync(encoding: utf8);
      if (alturaStr?.trim() == 'S') io.exit(0);
      return double.parse(alturaStr ?? '');
    } catch (e) {
      print('Erro ao ler a altura: $e');
      return _lerInf(text);
    }
  }
}



