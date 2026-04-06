# google_maps_places_autocomplete_widgets_butlerfork package

## Version 1.3.14 

#### New Features


#### Improvements


#### Fixes


---

## Version 1.3.13 (04-06-2026)

#### New Features


#### Improvements
- bump eslint from 10.1.0 to 10.2.0

#### Fixes


---

## Version 1.3.12 (03-27-2026)

#### New Features


#### Improvements


#### Fixes
- Added override for path-to-regexp@latest to package.json to correct CVE-2026-4923 & CVE-2026-4926 

---

## Version 1.3.11 (03-27-2026)

#### New Features


#### Improvements
- Updated dependencies in package.json

#### Fixes
- Added override for brace-expansion@latest to package.json to correct a vulnerability 

---

## Version 1.3.10 (03-03-2026)

#### New Features


#### Improvements
- Updated dependencies in pubspec.yaml and package.json

#### Fixes
- Added override for minimatch@latest to package.json to correct CVE-2026-27903


---

## Version 1.3.9 (02-11-2026)

Updated dependent package versions

---

## Version 1.3.8 (01-06-2026)

Updated package versions
Added a dependency override for qs to resolve CVE-2025-15284

---

## Version 1.3.7 (Dec 2, 2025)

Updated package versions

---

## Version 1.3.6 (Nov 19, 2025)

Updated package versions to latest
Added an override for js-yaml@latest to correct CVE-2025-64718

---

## Version 1.3.5 (Oct 16, 2025)

#### New Features
- Full repo & code base overhaul

#### Improvements
- Full repo & code base overhaul

#### Fixes
- Full repo & code base overhaul

---

## 1.3.4

Package forked from https://github.com/timmaffett/google_maps_places_autocomplete_widgets and modified for server-side use via a Node.js application 

## 1.3.3

* Fix dart analyze warning about using deprecated postalCodeLookup (which we use internally to allow it to continue to work
  while at the same time being deprecated.

## 1.3.2

* Correct screenshot image

## 1.3.1

* Added `screenshots:` section to `pubspec.yaml`

## 1.3.0

* Added `type` and `types` arguments for specifying the `AutoCompleteType` enum of Google Places autocomplete information to
  return.  (Defaults to `AutoCompleteType.address`).  
  This allows `AutoCompleteType.cities` as [Issue #1](https://github.com/timmaffett/google_maps_places_autocomplete_widgets/issues/1) requested.
* Deprecated the use of `postalCodeLookup` parameter, use `type:AutoCompleteType.postalCode` instead)

## 1.2.6

* Added `homepage:` and `issuetracker:` fields to pubspec.yaml

## 1.2.5

* Updated pubspec.yaml to add topics
* Fix typos in README.md, dart format

## 1.2.4

* Updated to current sdk and packages

## 1.2.3

* Updated to current packages

## 1.2.2

* Added `onFinishedEditingWithNoSuggestion` callback from [this pr](https://github.com/leandro-zanardi/maps_places_autocomplete/pull/6)

## 1.2.1

* Updated README.md, modified version number to properly reflect the number of internal versions
  iterated through before public release.

## 1.0.1

* Refactor suggestion query and overlay functionality to `SuggestionOverlayMixin`
  mixin via the clases `AddresssAutocompleteStatefulWidget` and
  `OverlaySuggestionDetails`.
* Refactor big gain is now there is a single version of all suggestiona and overlay
  functionality for both `AddressAutocompleteTextField` and
  `AddressAutocompleteTextFormField`.
* Extensive expansion of the `example/main.dart` example app to show most various
  features of the package.
* Moved to new package name and layout.

## 1.0.0

* Refactor package and create both `TextField` and `TextFormField` versions of the
  `AddressAutocompleteXXXX` widgets
* Add many more callback capabilities to allow modification of behavior in various
  ways.
* Added `TextFieldTapRegion` use for desktop support
* Extensive testing and bug fixing
* Add many more standard `Place` properties
* Change to retrieve additional formatted address info from google maps api
* Added support for zip code lookup

## 0.0.2

* Add custom layout config.

## 0.0.1

* Initial release.
