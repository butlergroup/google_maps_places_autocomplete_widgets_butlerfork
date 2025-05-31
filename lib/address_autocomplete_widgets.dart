/// Use [AddressAutocompleteTextField] to replace [TextField] widgets where you want to add Google Places autocompletion.
/// Use [AddressAutocompleteTextFormField] to replace [TextFormField] widgets where you want to add Google Places autocompletion.
/// You only requirement is to supply your Google Maps API key in the [mapsApiKey] parameter.
/// You optionally can specify the type of Google Places autocomplete information returned using the [type] or [types] parameters
/// (The default is [AutoCompleteType.address]).
library;

export 'package:google_maps_places_autocomplete_widgets_butlerfork/api/autocomplete_types.dart';
export 'package:google_maps_places_autocomplete_widgets_butlerfork/widgets/address_autocomplete_textfield.dart';
export 'package:google_maps_places_autocomplete_widgets_butlerfork/widgets/address_autocomplete_textformfield.dart';
export 'package:google_maps_places_autocomplete_widgets_butlerfork/model/place.dart';
export 'package:google_maps_places_autocomplete_widgets_butlerfork/model/suggestion.dart';
