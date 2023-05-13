import 'package:fixitpro/features/user/data/user_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fixitpro/features/user/ui/register_page.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('RegisterPage form test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RegisterFormProvider()),
        ],
        child: const RegisterPage(),
      ),
    ));

    // Check if the form fields exist
    expect(find.byKey(const Key('firstName')), findsOneWidget);
    expect(find.byKey(const Key('lastName')), findsOneWidget);
    expect(find.byKey(const Key('dateOfBirth')), findsOneWidget);

    // Fill the form fields
    await tester.enterText(find.byKey(const Key('firstName')), 'Juan');
    await tester.enterText(find.byKey(const Key('lastName')), 'Zapata');

    // Check if the entered text is correctly reflected in the UI
    expect(find.text('Juan'), findsOneWidget);
    expect(find.text('Zapata'), findsOneWidget);

    // Tap the submit button
    await tester.tap(find.byKey(const Key('submitButton')));
    await tester.pumpAndSettle();
  });

  testWidgets('RegisterPage address addition test',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RegisterFormProvider()),
        ],
        child: const RegisterPage(),
      ),
    ));

    // Check if the address field and add address button exist
    expect(find.byKey(const Key('address0')), findsOneWidget);
    expect(find.byKey(const Key('addAddressButton')), findsOneWidget);

    // Fill the address1 field
    await tester.enterText(
        find.byKey(const Key('address0')), 'Calle 0 # 65 -34 Medellin, Colombia');

    // Check if the address was added
    expect(find.text('Calle 0 # 65 -34 Medellin, Colombia'), findsOneWidget);

    // Tap the add address button
    await tester.tap(find.byKey(const Key('addAddressButton')));
    await tester.pump();

    // Check if address2 widget was added
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
