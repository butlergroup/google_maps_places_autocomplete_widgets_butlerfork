import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_places_autocomplete_widgets_butlerfork/address_autocomplete_widgets.dart';
import 'package:google_maps_places_autocomplete_widgets_butlerfork/calculator.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });
  testWidgets('AddressAutocompleteTextField renders without error',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AddressAutocompleteTextField(
            onChanged: print, // mock callback
          ),
        ),
      ),
    );

    // Verify that the widget renders
    expect(find.byType(AddressAutocompleteTextField), findsOneWidget);
  });

  testWidgets('AddressAutocompleteTextFormField renders without error',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: AddressAutocompleteTextFormField(
            onChanged: print, // mock callback
          ),
        ),
      ),
    );

    // Verify that the widget renders
    expect(find.byType(AddressAutocompleteTextFormField), findsOneWidget);
  });
}
