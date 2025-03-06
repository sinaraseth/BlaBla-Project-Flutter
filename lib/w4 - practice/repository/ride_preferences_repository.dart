import 'package:week_3_blabla_project/w4 - practice/model/ride_pref/ride_pref.dart';

abstract class RidePreferencesRepository {

  List<RidePreference> getPastPreferences();

  void addPreference(RidePreference preference);
}
