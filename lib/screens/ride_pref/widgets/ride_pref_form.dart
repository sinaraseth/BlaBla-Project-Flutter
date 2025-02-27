import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:week_3_blabla_project/utils/animations_util.dart';

import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/widgets/actions/buttons/bla_button.dart';
import 'package:week_3_blabla_project/widgets/display/bla_divider.dart';
import 'package:week_3_blabla_project/screens/location/widgets/location_picker_screen.dart';

/// A Ride Preference Form to select:
///   - A departure location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an optional initial RidePref.
class RidePrefForm extends StatefulWidget {
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------
  @override
  void initState() {
    super.initState();
    departureDate = DateTime.now(); // Default date
    requestedSeats = 1; // Default seats
    if (widget.initRidePref != null) {
      departure = widget.initRidePref?.departure;
      arrival = widget.initRidePref?.arrival;
      departureDate = widget.initRidePref?.departureDate ?? DateTime.now();
      requestedSeats = widget.initRidePref?.requestedSeats ?? 1;
    }
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------

  // Navigate to location picker and handle selection
  Future<void> _selectLocation(bool isDeparture) async {
    final Location? selectedLocation = await Navigator.push(
      context,
      AnimationUtils.createBottomToTopRoute(
        LocationPickerScreen(
          // title: isDeparture ? "Select departure" : "Select destination",
        ),
      ),
    );

    if (selectedLocation != null) {
      setState(() {
        if (isDeparture) {
          departure = selectedLocation;
        } else {
          arrival = selectedLocation;
        }
      });
    }
  }

  // Open date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: departureDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != departureDate) {
      setState(() {
        departureDate = picked;
      });
    }
  }

  // Swap departure and arrival locations
  void _swapLocations() {
    setState(() {
      final temp = departure;
      departure = arrival;
      arrival = temp;
    });
  }

  // Validation for the Search button
  bool _isFormValid() {
    return departure != null && arrival != null && requestedSeats > 0;
  }

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  // This function can be used to build ListTile components for departure, arrival, date, etc.
  Widget _buildLocationTile(String title, Location? location, Function onTap,
      {bool isDeparture = true}) {
    return ListTile(
      leading: Icon(
          isDeparture
              ? Icons.radio_button_unchecked_rounded
              : Icons.location_on_outlined,
          color: BlaColors.neutralLight),
      title: Text(
        location?.name ?? title,
        style: BlaTextStyles.label.copyWith(
            color: location != null
                ? BlaColors.neutralDark
                : BlaColors.neutralLight),
      ),
      subtitle: location != null
          ? Text(
              location.country.toString().split('.').last,
              style:
                  BlaTextStyles.label.copyWith(color: BlaColors.neutralLighter),
            )
          : null,
      trailing: isDeparture
          ? GestureDetector(
              onTap: _swapLocations,
              child: Icon(Icons.swap_vert, color: BlaColors.primary),
            )
          : null,
      onTap: () => onTap(),
    );
  }

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Departure Location Tile
        _buildLocationTile("Leaving from", departure, () {
          _selectLocation(true);
        }, isDeparture: true),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: BlaDivider(),
        ),

        // Arrival Location Tile
        _buildLocationTile("Going to", arrival, () {
          _selectLocation(false);
        }, isDeparture: false),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: BlaDivider(),
        ),

        // Date Selection Tile
        ListTile(
          leading: Icon(Icons.calendar_month, color: BlaColors.neutralLight),
          title: Text(
            DateFormat('E d MMM').format(departureDate),
            style: BlaTextStyles.label.copyWith(color: BlaColors.neutralDark),
          ),
          onTap: () => _selectDate(context),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: BlaDivider(),
        ),

        // Number of Seats Tile
        ListTile(
          leading: Icon(Icons.person, color: BlaColors.neutralLight),
          title: Text(
            requestedSeats.toString(),
            style: BlaTextStyles.label.copyWith(color: BlaColors.neutralDark),
          ),
          onTap: () {
            // TODO: Implement seat selection
          },
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: BlaDivider(),
        ),

        // Search Button
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: BlaButton(
              text: "Search",
              type: "PRIMARY",
              onPressed: () {
                if (_isFormValid()) {
                  // Create a new RidePref object with the selected values
                  final ridePref = RidePref(
                    departure: departure!,
                    arrival: arrival!,
                    departureDate: departureDate,
                    requestedSeats: requestedSeats,
                  );

                  // You can either navigate to the next screen or return the ridePref
                  print("RidePref created: $ridePref");

                  // Example: Show a snackbar with the selection
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Searching for rides from ${departure!.name} to ${arrival!.name} on ${DateFormat('E d MMM').format(departureDate)}"),
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else {
                  // Show error message if form is invalid
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Validation Error"),
                        content: Text(
                            "Please select both departure and arrival locations, date, and seats."),
                        actions: <Widget>[
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
