import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/widgets/inputs/location_picker.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

class LocationPickerScreen extends StatelessWidget {
  final String title;
  
  const LocationPickerScreen({
    Key? key,
    this.title = "Select location",
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: BlaTextStyles.label.copyWith(color: BlaColors.neutralDark)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: BlaColors.neutralDark),
      ),
      body: LocationPicker(
        onLocationSelected: (location) {
          // Return the selected location and close the screen
          Navigator.pop(context, location);
        },
      ),
    );
  }
}