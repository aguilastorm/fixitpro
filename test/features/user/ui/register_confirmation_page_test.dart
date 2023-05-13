import 'package:fixitpro/features/user/data/user_form_provider.dart';
import 'package:fixitpro/features/user/ui/register_confirmation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';


void main() {
  testWidgets('Register confirmation page displays name and date of birth',
      (WidgetTester tester) async {
    final registerForm = RegisterFormProvider();
    registerForm.firstName = 'John';
    registerForm.lastName = 'Doe';
    registerForm.dateOfBirth = DateTime(1990, 1, 1);
    final addresses = ['A', 'B', 'C'];

    for (final address in addresses) {
      registerForm.updateAddress(addresses.indexOf(address), address);
      registerForm.addNewFieldAddress();
    }

    await tester.pumpWidget(
      ChangeNotifierProvider<RegisterFormProvider>.value(
        value: registerForm,
        child: const MaterialApp(
          home: RegisterConfirmationPage(),
        ),
      ),
    );

    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('01/01/1990'), findsOneWidget);
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
    expect(find.text('C'), findsOneWidget);
  });

  testWidgets('RegisterConfirmationPage UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RegisterFormProvider()),
        ],
        child: const RegisterConfirmationPage(),
      ),
    ));

    await expectLater(
      find.byType(RegisterConfirmationPage),
      matchesGoldenFile('test/goldens/register_confirmation_page.png'),
    );
  });
}
