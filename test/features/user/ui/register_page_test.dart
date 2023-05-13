import 'package:fixitpro/features/user/data/user_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fixitpro/features/user/ui/register_page.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('Register page renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RegisterFormProvider()),
        ],
        child: const RegisterPage(),
      ),
    ));

    expect(find.text('Registro'), findsOneWidget);
    expect(find.byKey(const Key('firstName')), findsOneWidget);
    expect(find.byKey(const Key('lastName')), findsOneWidget);
    expect(find.byKey(const Key('dateOfBirth')), findsOneWidget);
    expect(find.byKey(const Key('submitButton')), findsOneWidget);
  });

  testWidgets('First name and last name fields cannot be empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RegisterFormProvider()),
        ],
        child: const RegisterPage(),
      ),
    ));

    await tester.tap(find.byKey(const Key('submitButton')));
    await tester.pump();

    expect(find.text('Este campo es requerido'), findsNWidgets(2));
  });

  testWidgets('New address field can be added', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RegisterFormProvider()),
        ],
        child: const RegisterPage(),
      ),
    ));

    expect(find.byKey(const Key('address0')), findsOneWidget);

    await tester.tap(find.byKey(const Key('addAddressButton')));
    await tester.pump();

    expect(find.byKey(const Key('address1')), findsOneWidget);
  });

  testWidgets('RegisterPage UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RegisterFormProvider()),
        ],
        child: const RegisterPage(),
      ),
    ));

    await expectLater(
      find.byType(RegisterPage),
      matchesGoldenFile('test/goldens/register_page.png'),
    );
  });
}
