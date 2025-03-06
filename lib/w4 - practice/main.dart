import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/w4 - practice/repository/mock/mock_ride_preferences_repository.dart';
import 'package:week_3_blabla_project/w4 - practice/screens/ride_pref/ride_pref_screen.dart';
import 'package:week_3_blabla_project/w4 - practice/service/ride_prefs_service.dart';
import 'package:week_3_blabla_project/w4 - practice/theme/theme.dart';
import 'package:week_3_blabla_project/w4 - practice/repository/mock/mock_locations_repository.dart';
import 'package:week_3_blabla_project/w4 - practice/service/locations_service.dart';
import 'package:week_3_blabla_project/w4 - practice/service/rides_service.dart';
import 'package:week_3_blabla_project/w4%20-%20practice/repository/mock/mock_rides_resonsitory.dart';


void main() {

  // 1 - Initialize the services
  RidePrefService.initialize(MockRidePreferencesRepository());
  LocationsService.initialize(MockLocationsRepository());
  RidesService.initialize(MockRidesRepository());

  // 2- Run the UI
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(body: RidePrefScreen()),
    );
  }
}
