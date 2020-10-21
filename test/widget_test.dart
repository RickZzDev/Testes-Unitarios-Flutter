// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:testStudy/main.dart';

void main() {
  const valorSemDesconto = 150.0;

  test("Deve calcular desconto corretamente utilizando numeros decimais", () {
    const desconto = 25.0;
    const valorComDesconto = valorSemDesconto - desconto;
    expect(calculaDesconto(valorSemDesconto, desconto, 0), valorComDesconto);
  });

  test("Deve dar erro com valor negativo ou menor que zero", () {
    // expect(
    // calculaDesconto(valorSemDesconto, desconto, false), valorComDesconto);
    expect(() => calculaDesconto(valorSemDesconto, -1, 0),
        throwsA(isA<ArgumentError>()));
    expect(() => calculaDesconto(valorSemDesconto, 0, 0),
        throwsA(isA<ArgumentError>()));
  });

  test("Deve dar erro com valor inicial zero ou negativo", () {
    // expect(
    // calculaDesconto(valorSemDesconto, desconto, false), valorComDesconto);
    expect(() => calculaDesconto(0, 15, 0), throwsA(isA<ArgumentError>()));
    expect(() => calculaDesconto(-1, 15, 0), throwsA(isA<ArgumentError>()));
  });
}
