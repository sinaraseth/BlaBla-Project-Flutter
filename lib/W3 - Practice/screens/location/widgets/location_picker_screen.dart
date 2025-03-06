import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/W3%20-%20Practice/model/ride/locations.dart';
import 'package:week_3_blabla_project/W3%20-%20Practice/widgets/inputs/location_picker.dart';

class LocationPickerScreen extends StatelessWidget {
  final String title; // Keeping this for compatibility, but not using it
  
  const LocationPickerScreen({
    Key? key,
    this.title = "Select location",
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LocationPicker(
          onLocationSelected: (location) {
            // Return the selected location and close the screen
            Navigator.pop(context, location);
          },
        ),
      ),
    );
  }
}