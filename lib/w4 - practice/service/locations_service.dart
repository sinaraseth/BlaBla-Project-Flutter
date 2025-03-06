import 'package:week_3_blabla_project/w4 - practice/model/ride/locations.dart';
import 'package:week_3_blabla_project/w4 - practice/repository/location_repository.dart';


////
///   This service handles:
///   - The list of available rides
///
class LocationsService {

  final LocationsRepository locationsRepository;

  LocationsService(this.locationsRepository);

  List<Location> getAvailableLocations() {
    return locationsRepository.getLocations();
  }
 
}