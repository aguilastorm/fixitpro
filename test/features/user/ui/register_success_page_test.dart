import 'package:fixitpro/features/user/data/user_form_provider.dart';
import 'package:fixitpro/features/user/ui/register_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'mocks/user_form_mock_provider.dart';


void main() {
  testWidgets('Register success page displays user information',
      (WidgetTester tester) async {
    final mockProvider = MockRegisterFormProvider();
    mockProvider.firstName = 'John';
    mockProvider.updateAddress(0, 'Address');

    await tester.pumpWidget(
      ChangeNotifierProvider<RegisterFormProvider>.value(
        value: mockProvider,
        child: const MaterialApp(
          home: RegisterSuccessPage(),
        ),
      ),
    );

    expect(find.text('John'), findsOneWidget);
    expect(find.text('Se han registrado tus datos exitosamente.'), findsOneWidget);
    expect(find.text('Enviaremos un tecnico de manera preventiva sin costo a tu dirección principal (Address) para evaluar el estado de tus electrodomesticos.'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('Tapping on the button clears the form and navigates to RegisterPage',
      (WidgetTester tester) async {
    final mockProvider = MockRegisterFormProvider();
    mockProvider.firstName = 'John';
    mockProvider.updateAddress(0, 'Address');

    await tester.pumpWidget(
      ChangeNotifierProvider<RegisterFormProvider>.value(
        value: mockProvider,
        child: const MaterialApp(
          home: RegisterSuccessPage()
        ),
      ),
    );

    await tester.tap(find.byKey(const Key('buttonNext')));
    await tester.pumpAndSettle();

    expect(find.byType(RegisterSuccessPage), findsOneWidget);
  });
}
