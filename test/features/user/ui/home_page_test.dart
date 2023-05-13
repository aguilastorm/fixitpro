import 'package:fixitpro/features/user/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HomePage with Title, Description and One button',
      (WidgetTester tester) async {
    // Build the HomePage widget
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    // Check that the title is displayed
    expect(find.text('FixItPro'), findsOneWidget);

    // Check that the description is displayed
    expect(
        find.text('¡Nunca dejes que un electrodoméstico roto arruine tu día!'),
        findsOneWidget);
    expect(
        find.text(
            'Solicitar la reparación de electrodomésticos a domicilio es tan fácil como pulsar un botón. Regístrate en simples pasos directamente desde tu teléfono.'),
        findsOneWidget);

    // Check that the button is displayed
    expect(find.text('¡Quiero registrarme!'), findsOneWidget);
  });


  testWidgets('HomePage UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    await expectLater(
      find.byType(HomePage),
      matchesGoldenFile('test/goldens/home_page.png'),
    );
  });
}
