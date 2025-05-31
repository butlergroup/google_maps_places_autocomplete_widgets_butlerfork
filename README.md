[![CodeQL](https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/actions/workflows/github-code-scanning/codeql/badge.svg)](https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/actions/workflows/github-code-scanning/codeql)
[![Flutter CI](https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/actions/workflows/dart.yml/badge.svg)](https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/actions/workflows/dart.yml)
[![Snyk Security-Monitored](https://img.shields.io/badge/Snyk%20Security-Monitored-purple)](https://app.snyk.io/share/784f6fef-6aaf-47ed-81ba-99e05b854665)
[![Coverage Status](https://coveralls.io/repos/github/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/badge.svg?branch=main)](https://coveralls.io/github/butlergroup/google_maps_places_autocomplete_widgets_butlerfork?branch=main)
[![OpenSSF Best Practices](https://www.bestpractices.dev/projects/10678/badge)](https://www.bestpractices.dev/projects/10678)
[![Scorecard supply-chain security](https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/actions/workflows/scorecard.yml/badge.svg)](https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/actions/workflows/scorecard.yml)
[![Feature Requests](https://img.shields.io/github/issues/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/feature-request.svg)](https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/issues?q=is%3Aopen+is%3Aissue+label%3Aenhancement)
[![Bugs](https://img.shields.io/github/issues/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/bug.svg)](https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/issues?utf8=✓&q=is%3Aissue+is%3Aopen+label%3Abug)

# Google_Maps_Places_Autocomplete_Widgets_ButlerFork

## Notes on Enhancements & Changes / How to Deploy

This package was forked & modified because it's typically safer to inject API keys and other sensitive runtime values server-side rather than client-side. To deploy the Node.js server that will handle the requests:

1. [Install Node.js](https://nodejs.org/en) or use nvm (Node version manager) to install Node.js [on Linux/MacOS](https://github.com/nvm-sh/nvm?tab=readme-ov-file#installing-and-updating) or [on Windows](https://github.com/coreybutler/nvm-windows).
2. Clone/fork the repo or download the ZIP. Copy package.json, start.js, ecosystem.config.js, and server.js to the folder on your server you want to host the application from. 
3. Run "npm install" from application root folder to install dependencies/packages.
4. Add your SSL certificate to a directory named ssl in the root of the project (key.pem and cert.pem are the files server.js is configured to look for). Ensure you have port 443 (or your port of choice) open for traffic. 
5. Install pm2 to manage and enable auto-start of the Node.js app: npm install pm2@latest -g (this is how the files in this project are configured). Then run "pm2 start ecosystem.config.js" to start the application. 
6. Change lines 124-125 and 295-296 of place_api_provider.dart to point to your domain and server endpoints of choice (must match what's defined in server.js).
7. Include this package in your Flutter/Dart project's pubspec.yaml dependencies. Build and deploy your app, and voila! Your application now interfaces with the Google Maps API server-side without potentially exposing your API key via the front-end. 
8. (optional) add our [env_encryption_tool_nodejs](https://github.com/butlergroup/env_encryption_tool_nodejs) to your Node.js code to encrypt your environment variables, adding even more security. 

## Additional Notes

Feature complete, 'drop in' replacements for Flutter `TextField` or `TextFormField` widgets, providing address autocompletion using the Google Maps Places API.
The only required additional parameter is your Google Maps API key.
Just rename `TextField` -> `AddressAutocompleteTextField`,
(or `TextFormField` -> `AddressAutocompleteTextFormField`),

If desired customize any look/behavior of the autocompletion using the additional optional parameters.

Additionally any of the other Google Places autocomplete information can be retrieved.

- Postal code/Zip code autocompletion is supported using the `type:AutoCompleteType.postalCode` parameter.
- Cities autocompletion is supported using the `type:AutoCompleteType.cities` parameter.  
   (`type:AutoCompleteType.cities` returns any `AutoCompleteType.locality` or `AutoCompleteType.administrativeAreaLevel_3` matched).
- Businesses and Establishment autocompletion is supported using the `type:AutoCompleteType.establishment` parameter.
- Region autocompletion is supported using the `type:AutoCompleteType.regions` parameter.  
    (`AutoCompleteType.regions` returns any `AutoCompleteType.locality`, `AutoCompleteType.sublocality`, `AutoCompleteType.postal_code`,
    `AutoCompleteType.country`, `AutoCompleteType.administrativeAreaLevel_1` or `AutoCompleteType.administrativeAreaLevel_2` matched)
- Or you can combine up to 5 of the `AutoCompleteType` enums using the `types` parameter  
    (eg. `types:[AutoCompleteType.bookStore,AutoCompleteType.bicycleStore,AutoCompleteType.school]`).

 (See [Table 3](https://developers.google.com/maps/documentation/places/web-service/supported_types#table3),
 [Table 1](https://developers.google.com/maps/documentation/places/web-service/supported_types#table1), and [Table 2](https://developers.google.com/maps/documentation/places/web-service/supported_types#table2)).

Easily incorporated into existing forms which contain multiple fields for capturing address information.

## Demo

![Short Demo of Included Example](media/small_demo.gif)

## Features

- Support for most common `TextField` and `TextFormField` parameters (and any
  less common parameter can easily be added).
- Support for both address and postal/zip code autocompletion. (`type:AutoCompleteType.address` or `type:AutoCompleteType.postalCode`)
- Support for ANY of other the Google Places autocompletion types (See [Table 3](https://developers.google.com/maps/documentation/places/web-service/supported_types#table3), [Table 1](https://developers.google.com/maps/documentation/places/web-service/supported_types#table1), and [Table 2](https://developers.google.com/maps/documentation/places/web-service/supported_types#table2))
- Robust set of optional callbacks that all customizing behavior in virtually any way.
- Easy 'drop in' replacement of address field in any flutter form.
- Easy customization of virtually every look and feel display/behavior property.
- Hooks allow filling multiple form fields (City, State, Zip, etc.) from results
  of user's address selection from the initial address form field autocomplete
  suggestions.
- Hooks to allow clearing of multiple other form fields when the clear button
  is used in the address autocomplete widget.
- Ability to customize the search query string with contents of other form fields
  before querying google maps places api.
- Ability to use the contents of the autocomplete suggestion without additional
  google maps places details api request.
- The base classes and mixin generics provided in this package allow for the addition
  of address autocompletion to virtually any of custom widgets.

## Usage

You can find a complete example of usage in `example/main.dart`.

import the package:

```dart
import 'package:google_maps_places_autocomplete_widgets_butlerfork/address_autocomplete_widgets.dart';
```

Add your google places api key, optional `onSuggestionClick` callback,
and optional language and country restrictions parameters:

```dart
AddressAutocompleteTextField(
    onSuggestionClick: onSuggestionClick,
    componentCountry: 'us',
    language: 'en-US'

    //..any other arguments that you would use with a TextField..

),
```

or

```dart
AddressAutocompleteTextFormField(
    onSuggestionClick: onSuggestionClick,
    componentCountry: 'us',
    language: 'en-US'

    //..any other arguments that you would use with a TextFormField..
),


```

To utilize any of the robust set of retrieved `Place` details write a
`onSuggestionClick` callback function:

```dart
void onSuggestionClick(Place placeDetails) {
    setState(() {
      // examples of the returned address details
      _name = placeDetails.name;
      _formattedAddress = placeDetails.formattedAddress;
      _formattedAddressZipPlus4 = placeDetails.formattedAddressZipPlus4;
      _streetAddress = placeDetails.streetAddress;
      _streetNumber = placeDetails.streetNumber;
      _street = placeDetails.street;
      _streetShort = placeDetails.streetShort;
      _city = placeDetails.city;
      _county = placeDetails.county;
      _state = placeDetails.state;
      _stateShort = placeDetails.stateShort;
      _zipCode = placeDetails.zipCode;
      _zipCodeSuffix = placeDetails.zipCodeSuffix;
      _zipCodePlus4 = placeDetails.zipCodePlus4;
      _country = placeDetails.country;
      _vicinity = placeDetails.vicinity;
      _lat = placeDetails.lat;
      _lng = placeDetails.lng;
    });
  }
```

## More complex use and customization examples

A complete example mobile/desktop applications illustrates the use of both common
and optional parameters.
This includes the use of the address autocomplete TextFormField widget to fill
multiple other TextFormFields from the user's selected address suggestion.

## Additional information

This package implements the official documentation of Google Maps Places API
and use address as types and receive a detail with address_component and geometry as fields only

GitHub Repo: [https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork](https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork)

## Acknowledgements

This package was originally based on source code from the package
`maps_places_autocomplete 0.0.2` by @leandro-zanardi.  As I customized my use case
within my own apps the source code diverged significantly from the original package
and it was easiest for me to create my own new package.

The rather unfortunate (and long) name for this package is a result of the
pub.dev namespace clutter of various packages also using Google Maps Places API.
