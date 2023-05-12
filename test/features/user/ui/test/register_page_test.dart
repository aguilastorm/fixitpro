import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fixitpro/features/user/ui/register_page.dart'; // Import your RegisterPage here

void main() {
  testWidgets('RegisterPage form test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: RegisterPage(),
    ));

    // Check if the form fields exist
    expect(find.byKey(const Key('firstName')), findsOneWidget);
    expect(find.byKey(const Key('lastName')), findsOneWidget);
    expect(find.byKey(const Key('dateOfBirth')), findsOneWidget);
    // expect(find.byKey(const Key('mainAddress')), findsOneWidget);

    // Fill the form fields
    await tester.enterText(find.byKey(const Key('firstName')), 'Juan');
    await tester.enterText(find.byKey(const Key('lastName')), 'Zapata');
    await tester.enterText(find.byKey(const Key('dateOfBirth')), '01/01/2002');
    // await tester.enterText(find.byKey(const Key('address1')),
    //     'Calle 78 # 65 -34 Medellin, Colombia');

    // Check if the entered text is correctly reflected in the UI
    expect(find.text('Juan'), findsOneWidget);
    expect(find.text('Zapata'), findsOneWidget);
    expect(find.text('01/01/2002'), findsOneWidget);
    // expect(find.text('Calle 78 # 65 -34 Medellin, Colombia'), findsOneWidget);

    // Tap the submit button
    await tester.tap(find.byKey(const Key('submitButton')));
    await tester.pumpAndSettle();
  });

  // testWidgets('RegisterPage address addition test',
  //     (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MaterialApp(
  //     home: RegisterPage(),
  //   ));

  //   // The number of addresses to be tested
  //   int numberOfAddresses = 5;

  //   for (int i = 0; i < numberOfAddresses; i++) {
  //     // Check if the address field and add address button exist
  //     expect(find.byKey(Key('address$i')), findsOneWidget);
  //     expect(find.byKey(const Key('addAddressButton')), findsOneWidget);

  //     // Fill the address1 field
  //     await tester.enterText(
  //         find.byKey(Key('address$i')), 'Calle 78 # 65 -34 Medellin, Colombia');

  //     // Check if the address was added
  //     expect(find.text('Calle $i # 65 -34 Medellin, Colombia'), findsOneWidget);

  //     // Tap the add address button
  //     await tester.tap(find.byKey(const Key('addAddressButton')));
  //     await tester.pump();

  //     // Check if address2 widget was added
  //     expect(find.byKey(Key('address${i + 1}')), findsOneWidget);
  //   }
  // });
}
