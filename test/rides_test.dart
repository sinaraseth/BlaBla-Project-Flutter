import 'package:week_3_blabla_project/w4 - practice/model/ride/locations.dart';
import 'package:week_3_blabla_project/w4 - practice/model/ride/ride.dart';
import 'package:week_3_blabla_project/w4 - practice/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/w4 - practice/service/rides_service.dart';
import 'package:week_3_blabla_project/w4%20-%20practice/repository/mock/mock_rides_resonsitory.dart';

void main() {
  // 1 - Create a  ride services
  RidesService.initialize(MockRidesRepository());

  // FAKE LOCATIONS
  Location battambang = Location(name: "Battambang", country: Country.cambodia);

  Location siemReap = Location(name: "Siem Reap", country: Country.cambodia);

  // 2 - Create a ride preference
  RidePreference pref = RidePreference(
    departure: battambang,
    departureDate: DateTime.now(),
    arrival: siemReap,
    requestedSeats: 1,
  );

  List<Ride> availableRides = RidesService.instance.getRidesFor(pref, null);

  print(availableRides);
}