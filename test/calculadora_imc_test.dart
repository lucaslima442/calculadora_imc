import 'dart:convert';
import 'dart:io';

import 'package:calculadora_imc/calculadora_imc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

@GenerateMocks([MockStdin])
void main() {
  CalculadoraIMC calculadora = CalculadoraIMC();
  MockStdin mockStdin = MockStdin();

  test('Classificar Risco - limite maximo', () {
    expect(CalculadoraIMC.classificarIMC(41), 'Obesidade Grau III (mórbida)');
  });

  test('Classificar Risco - limite minimo', () {
    expect(CalculadoraIMC.classificarIMC(15), 'Magreza grave');
  });

  test('calculo - máximo', () {
    when(mockStdin.readLineSync(encoding: utf8)).thenReturnInOrder(['1.6', '160']);
    expect(calculadora.calcularIMC(stdin: mockStdin).toStringAsFixed(2), '62.50');
  });

  test('calculo - mínimo', () {
    when(mockStdin.readLineSync(encoding: utf8)).thenReturnInOrder(['1.8', '48']);
    expect(calculadora.calcularIMC(stdin: mockStdin).toStringAsFixed(2), '14.81');
  });

  test('calculo - Saldável', () {
    when(mockStdin.readLineSync(encoding: utf8)).thenReturnInOrder(['1.8', '78']);
    expect(calculadora.calcularIMC(stdin: mockStdin).toStringAsFixed(2), '24.07');
  });

}

class MockStdin extends Mock implements Stdin {}

