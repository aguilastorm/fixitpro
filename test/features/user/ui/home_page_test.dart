import 'package:fixitpro/features/user/ui/home_page.dart';
import 'package:fixitpro/features/user/ui/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('HomePage with Title, Description and One button', (WidgetTester tester) async {
    // Build the HomePage widget
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    // Check that the title is displayed
    expect(find.text('FixItPro'), findsOneWidget);

    // Check that the description is displayed
    expect(find.text('¡Nunca dejes que un electrodoméstico roto arruine tu día! Con FixItPro, solicitar la reparación de electrodomésticos a domicilio es tan fácil como pulsar un botón. Regístrate, agrega tus direcciones y solicita servicios de reparación directamente desde tu teléfono.'), findsOneWidget);

    // Check that the button is displayed
    expect(find.text('Quiro suscribirme!'), findsOneWidget);
  });

   testWidgets('Test button press navigates to RegisterPage', (WidgetTester tester) async {
    // Wrap your HomePage inside a MaterialApp widget
    await tester.pumpWidget(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/register': (context) => const RegisterPage(), // Define your routes
      },
    ));

    // Find the 'Quiero suscribirme!' button and tap it
    final button = find.text('Quiero suscribirme!');
    await tester.tap(button);

    // Rebuild the widget tree after the state change
    await tester.pumpAndSettle();

    // Verify that the RegisterPage is displayed
    expect(find.byType(RegisterPage), findsOneWidget);
  });
}
