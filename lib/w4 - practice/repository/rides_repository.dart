import 'package:week_3_blabla_project/w4 - practice/model/ride/ride.dart';
import 'package:week_3_blabla_project/w4 - practice/model/ride/ride_filter.dart';
import 'package:week_3_blabla_project/w4 - practice/model/ride_pref/ride_pref.dart';

abstract class RidesRepository {
  List<Ride> getRides(RidePreference ridePreference);
  List<Ride> getRidesFor(RidePreference ridePreference, RideFilter? rideFilter);
}