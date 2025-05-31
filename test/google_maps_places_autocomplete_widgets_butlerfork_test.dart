import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_places_autocomplete_widgets_butlerfork/address_autocomplete_widgets.dart';

void main() {
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

  test('Place model handles data correctly', () {
    final place = Place(
      streetNumber: '1600',
      street: 'Amphitheatre',
      city: 'Mountain View',
      country: 'USA',
    );
    expect(place.city, 'Mountain View');
  });

  test('Suggestion model holds description and placeId', () {
    final suggestion = Suggestion('abc123', 'Google HQ');
    expect(suggestion.description, 'Google HQ');
  });
}
