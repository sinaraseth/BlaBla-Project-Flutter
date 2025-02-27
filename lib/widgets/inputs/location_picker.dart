import 'package:flutter/material.dart';
import '../../model/ride/locations.dart';
import './search_text_field.dart';
import './location_list_view.dart';
import '../../dummy_data/dummy_data.dart';

class LocationPicker extends StatefulWidget {
  final Function(Location)? onLocationSelected;

  const LocationPicker({Key? key, this.onLocationSelected}) : super(key: key);

  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  final TextEditingController searchController = TextEditingController();
  List<Location> filteredLocations = fakeLocations;

  void filterLocations(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredLocations = fakeLocations;
      } else {
        filteredLocations = fakeLocations
            .where((location) =>
                location.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void handleLocationSelection(Location location) {
    // Call the callback if provided
    if (widget.onLocationSelected != null) {
      widget.onLocationSelected!(location);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchTextField(
          controller: searchController,
          onChanged: filterLocations,
        ),
        Expanded(
          child: LocationListView(
            locations: filteredLocations,
            onLocationTap: handleLocationSelection,
          ),
        ),
      ],
    );
  }
}