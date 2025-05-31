import '/api/place_api_provider.dart';
import '/api/autocomplete_types.dart';
import '/model/place.dart';
import '/model/suggestion.dart';

class AddressService {
  AddressService(this.sessionToken, this.componentCountry, this.language) {
    apiClient = PlaceApiProvider(sessionToken, componentCountry, language);
  }

  final String sessionToken;
  final String? componentCountry;
  final String? language;
  late PlaceApiProvider apiClient;

  Future<List<Suggestion>> search(String query,
      {bool includeFullSuggestionDetails = false,
      List<AutoCompleteType> types = const [AutoCompleteType.address]}) async {
    return await apiClient.fetchSuggestions(query,
        includeFullSuggestionDetails: includeFullSuggestionDetails,
        types: types);
  }

  Future<Place> getPlaceDetail(String placeId) async {
    Place placeDetails = await apiClient.getPlaceDetailFromId(placeId);
    return placeDetails;
  }
}
