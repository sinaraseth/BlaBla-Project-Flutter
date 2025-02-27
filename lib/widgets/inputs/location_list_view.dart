import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import '../../model/ride/locations.dart';

class LocationListView extends StatelessWidget {
  final List<Location> locations;
  final Function(Location) onLocationTap;

  const LocationListView({
    Key? key,
    required this.locations,
    required this.onLocationTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) {
        final location = locations[index];
        return ListTile(
          title: Text(location.name, style: BlaTextStyles.label.copyWith(color: BlaColors.neutralDark)),
          subtitle: Text(location.country.toString(),style: BlaTextStyles.label.copyWith(color: BlaColors.neutralLighter)),
          trailing: Icon(Icons.arrow_forward_ios, size: 16, color: BlaColors.neutralLight,),
          onTap: () => onLocationTap(location),
        );
      },
    );
  }
}