import 'package:fixitpro/features/user/data/user_form_provider.dart';
import 'package:fixitpro/features/user/services/user_register_service.dart';
import 'package:fixitpro/features/user/ui/home_page.dart';
import 'package:fixitpro/features/user/ui/register_birthdate_page.dart';
import 'package:fixitpro/features/user/ui/register_name_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('RegisterNamePage form test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => RegisterFormProvider()),
          ChangeNotifierProvider(create: (_) => UserService()),
        ],
        child: const RegisterNamePage(),
      ),
      routes: {
        '/register-birthdate': (context) => const RegisterBirthDatePage(),
      },
    ));

    // Check if the form fields exist
    expect(find.byKey(const Key('firstName')), findsOneWidget);
    expect(find.byKey(const Key('lastName')), findsOneWidget);

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

  //    testWidgets('Test button press navigates to RegisterBirthDatePage', (WidgetTester tester) async {
  //   // Wrap your HomePage inside a MaterialApp widget
  //   await tester.pumpWidget(MaterialApp(
  //     initialRoute: '/',
  //     routes: {
  //       '/register-name': (context) => const RegisterNamePage(),
  //       '/register-birthdate': (context) => const RegisterBirthDatePage(), // Define your routes
  //     },
  //   ));

  //   // Find the 'Continuar' button and tap it
  //   final button = find.text('Continuar');
  //   await tester.tap(button);

  //   // Rebuild the widget tree after the state change
  //   await tester.pumpAndSettle();

  //   // Verify that the RegisterPage is displayed
  //   expect(find.byType(RegisterBirthDatePage), findsOneWidget);
  // });
}
