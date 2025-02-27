import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/widgets/actions/buttons/bla_button.dart';
import 'package:week_3_blabla_project/widgets/display/bla_divider.dart';

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
  Widget _buildLocationTile(String title, Location? location, Function onTap, {bool isDeparture = true}) {
    return ListTile(
      leading: Icon(Icons.radio_button_unchecked_rounded, color: BlaColors.neutralLight),
      title: Text(
        location?.name ?? title,
        style: BlaTextStyles.label.copyWith(color: BlaColors.neutralLight),
      ),
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
          // TODO: Implement location picker
        }, isDeparture: true),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: BlaDivider(),
        ),

        // Arrival Location Tile
        _buildLocationTile("Going to", arrival, () {
          // TODO: Implement location picker
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
          padding: const EdgeInsets.all(0),
          child: SizedBox(
            width: double.infinity,
            child: BlaButton(
              text: "Search",
              type: "PRIMARY",
              onPressed: () {
                if (_isFormValid()) {
                  // Proceed with search functionality
                } else {
                  // Show error message if form is invalid
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Validation Error"),
                        content: Text("Please select both departure and arrival locations, date, and seats."),
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
