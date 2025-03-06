import 'package:week_3_blabla_project/w4 - practice/model/ride/locations.dart';
import 'package:week_3_blabla_project/w4 - practice/repository/location_repository.dart';

class MockLocationsRepository extends LocationsRepository {
  final Location phnomPenh =
      Location(name: "Phnom Penh", country: Country.cambodia);
  final Location siemReap =
      Location(name: "Siem Reap", country: Country.cambodia);
  final Location sihanoukville =
      Location(name: "Sihanoukville", country: Country.cambodia);
  final Location kampot = Location(name: "Kampot", country: Country.cambodia);

  @override
  List<Location> getLocations() {
    return [phnomPenh, siemReap, sihanoukville, kampot];
  }
}