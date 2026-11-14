[![CodeQL](https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/actions/workflows/github-code-scanning/codeql/badge.svg)](https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/actions/workflows/github-code-scanning/codeql)
[![Flutter CI](https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/actions/workflows/dart.yml/badge.svg)](https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/actions/workflows/dart.yml)
[![Dependabot Updates](https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/actions/workflows/dependabot/dependabot-updates/badge.svg)](https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/actions/workflows/dependabot/dependabot-updates)
[![Snyk Security-Monitored](https://img.shields.io/badge/Snyk%20Security-Monitored-purple)](https://app.snyk.io/share/784f6fef-6aaf-47ed-81ba-99e05b854665)
[![OpenSSF Best Practices](https://www.bestpractices.dev/projects/10678/badge)](https://www.bestpractices.dev/projects/10678)
[![Scorecard supply-chain security](https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/actions/workflows/scorecard.yml/badge.svg)](https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/actions/workflows/scorecard.yml)
[![Microsoft Defender For Devops](https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/actions/workflows/defender-for-devops.yml/badge.svg)](https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/actions/workflows/defender-for-devops.yml)
[![Coverage Status](https://coveralls.io/repos/github/butlergroup/google_maps_places_autocomplete_widgets_butlerfork/badge.svg?branch=main)](https://coveralls.io/github/butlergroup/google_maps_places_autocomplete_widgets_butlerfork?branch=main)
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

## Contact

Have questions or suggestions? Reach out to us at welcome@butlergroup.net. Thank you and happy coding! :)

## Additional Notes

> **Three interchangeable Google Places backends — same widgets, same results:**
>
> - ✅ **Places API (New)** *(default)* — modern REST API, works on **every platform including Flutter web**
> - ✅ **Legacy Places API** — one parameter (`apiVersion: PlacesApiVersion.legacy`) for older Cloud projects where it is still enabled
> - ✅ **Native Places SDKs for Android/iOS** — via the companion package [`google_maps_places_autocomplete_widgets_native`](https://pub.dev/packages/google_maps_places_autocomplete_widgets_native): app-restricted API keys with **zero configuration**, plus optional **Firebase App Check** attestation so a leaked or scraped key **cannot be abused outside your genuine app**
>
> …or inject any custom backend (e.g. a key-hiding server proxy) via `placeApiProvider:`.

Feature complete, 'drop in' replacements for Flutter `TextField` or `TextFormField` widgets, providing address autocompletion using the Google Maps Places API.
The only required additional parameter is your Google Maps API key
(or omit it entirely and supply your own `placeApiProvider` backend).
Just rename `TextField` -> `AddressAutocompleteTextField`,
(or `TextFormField` -> `AddressAutocompleteTextFormField`),

As of v2.0.0 the widgets use **Places API (New)** by default (the legacy
Places API cannot be enabled on new Google Cloud projects). Make sure
["Places API (New)"](https://console.cloud.google.com/apis/library/places.googleapis.com)
is enabled for your API key's project. Existing 1.x users: see
[MIGRATION.md](MIGRATION.md) — for most apps no code changes are needed. To
temporarily keep using the legacy API, pass `apiVersion: PlacesApiVersion.legacy`.

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

- Uses Google **Places API (New)** by default; the legacy Places API remains
  available via `apiVersion: PlacesApiVersion.legacy`.
- Supports application-restricted API keys via `androidPackageName`,
  `androidCertSha1Fingerprint` and `iosBundleId` (sent as Google's
  `X-Android-Package` / `X-Android-Cert` / `X-Ios-Bundle-Identifier` headers).
  For the strongest client-side key protection (native SDK identity + optional
  Firebase App Check attestation) use the companion package
  [`google_maps_places_autocomplete_widgets_native`](https://pub.dev/packages/google_maps_places_autocomplete_widgets_native)
  on Android/iOS.
- Pluggable backend: implement the public `PlaceApiProvider` abstract class
  and pass it as `placeApiProvider:` to use your own proxy/native backend
  (also handy as a fake in widget tests).
- **Flutter web now works** (with the default new API): `places.googleapis.com`
  supports CORS, so browsers can call it directly — use a referrer-restricted
  key. The legacy API never worked on web (its endpoint sends no CORS headers).
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

## Securing your Google Maps API key

Any API key that ships inside an app binary or web page can be extracted —
from an APK/IPA, from browser dev tools, or by sniffing traffic — and a
leaked Places key can be abused to run up **your** bill. Places API (New)
gives you escalating levels of protection, all supported by this package
family:

| | Approach | Platforms | Protection |
|---|----------|-----------|-----------|
| 1 | Restricted key + this package's `androidPackageName:` / `androidCertSha1Fingerprint:` / `iosBundleId:` parameters (sent as Google's restriction headers over REST) | all | **Deterrent only** — these header values are public information, so they stop key-scraping bots and accidental reuse, not determined attackers |
| 2 | [`google_maps_places_autocomplete_widgets_native`](https://pub.dev/packages/google_maps_places_autocomplete_widgets_native) — the companion package backing these same widgets with Google's **native Places SDKs** | Android, iOS | The SDK attaches your app's identity (package + signing cert / bundle id) itself, so **app-restricted keys work with zero configuration** and can't be borrowed by simply copying headers |
| 3 | The native package with **Firebase App Check** enabled (`useAppCheck: true`) | Android, iOS | **Cryptographic app attestation** (Play Integrity / App Attest). With enforcement turned on, Google rejects every request that doesn't come from your genuine app — a scraped or leaked key becomes useless |
| 4 | Your own backend proxy injected via `placeApiProvider:` | all | **Strongest**: the key lives on your server and never ships to clients at all |

On **web**, use an HTTP-referrer-restricted key (the browser itself
enforces nothing — tier 4 is the only strong option there). Whatever the
tier, also set **API restrictions** (key valid only for Places API (New))
and quota caps in the Cloud console.

### Using the native Places SDK backend (Android/iOS)

The companion package drops into the same widgets — initialize once at
startup and inject its provider (no `mapsApiKey:` on the widget at all,
since core 2.1.0):

```dart
await NativePlaceApiProvider.initialize(
  mapsApiKey: yourKey,
  useAppCheck: true, // opt-in Firebase App Check attestation (tier 3)
);

AddressAutocompleteTextField(
  placeApiProvider: NativePlaceApiProvider(componentCountry: 'us'),
  onSuggestionClick: onSuggestionClick,
),
```

Everything else about the widgets — callbacks, styling, the parsed `Place`
results — is identical on either backend. See
[that package's README](https://pub.dev/packages/google_maps_places_autocomplete_widgets_native)
for platform setup and a step-by-step App Check walkthrough (Firebase
project, debug tokens, monitoring, and flipping on enforcement). The full
flow — including a leaked key being rejected under enforcement while the
real app keeps working — has been verified end-to-end on physical devices.

Migrating an existing app (1.x or 2.x REST) to the native backend?
**[MIGRATION_NATIVE.md](MIGRATION_NATIVE.md)** is a complete step-by-step
playbook — written so you can also hand it directly to an AI coding agent
("apply MIGRATION_NATIVE.md from the google_maps_places_autocomplete_widgets_butlerfork
repo to this project").

## Usage

You can find a complete example of usage in `example/lib/main.dart`.

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

### Notes when using Places API (New) (the default)

- The legacy `address` type filter has no equivalent in the new API;
  `AutoCompleteType.address` (the default) is translated to
  `street_address` + `premise` + `subpremise`. Use
  `type: AutoCompleteType.geocode` for broader geocoding matches.
- `Suggestion.terms` is always `null` (no new-API equivalent).
- See [MIGRATION.md](MIGRATION.md) for key-restriction setup and custom
  `placeApiProvider` backends.

## More complex use and customization examples

A complete example mobile/desktop applications illustrates the use of both common
and optional parameters.
This includes the use of the address autocomplete TextFormField widget to fill
multiple other TextFormFields from the user's selected address suggestion.

## Additional information

This package follows the official Google Maps Places API documentation. The
autocomplete requests use your chosen `type`/`types` filters (defaulting to
address results) and the details request retrieves the address components,
formatted address and location used to populate the returned `Place`.

GitHub Repo: [https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork](https://github.com/butlergroup/google_maps_places_autocomplete_widgets_butlerfork)

## Acknowledgements

This package was originally based on source code from the package
`maps_places_autocomplete 0.0.2` by @leandro-zanardi.  As I customized my use case
within my own apps the source code diverged significantly from the original package
and it was easiest for me to create my own new package.

The rather unfortunate (and long) name for this package is a result of the
pub.dev namespace clutter of various packages also using Google Maps Places API.

## Star History

[![Star History Chart](https://api.star-history.com/chart?repos=butlergroup/google_maps_places_autocomplete_widgets_butlerfork&type=date&legend=top-left&sealed_token=Cfh-tC0M8aFxFCXQi09XXJSk_Gtht8OsT1aIXNO0qxwyG7kGIqKGS9YrCYVoaN3W0lSMf1PAzwF_oWAjN0mGlycjUJ9McTxvRRElPYpytcD07ZwuL-qCrQ)](https://www.star-history.com/?type=date&repos=butlergroup%2Fgoogle_maps_places_autocomplete_widgets_butlerfork)
