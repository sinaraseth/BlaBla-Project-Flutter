import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:week_3_blabla_project/W3%20-%20Practice/dummy_data/dummy_data.dart';
import 'package:week_3_blabla_project/W3%20-%20Practice/model/ride/locations.dart';
import 'package:week_3_blabla_project/W3%20-%20Practice/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/W3%20-%20Practice/theme/theme.dart';
import 'package:week_3_blabla_project/W3%20-%20Practice/widgets/actions/buttons/bla_button.dart';
import 'package:week_3_blabla_project/W3%20-%20Practice/widgets/display/bla_divider.dart';

class RidePrefForm extends StatefulWidget {
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  Location? arrival;
  late DateTime departureDate;
  int requestedSeats = 1;

  @override
  void initState() {
    super.initState();
    departureDate = DateTime.now(); // Default date
    
    // Set default locations from dummy data (London to Manchester)
    departure = fakeLocations.firstWhere((loc) => loc.name == "London");
    arrival = fakeLocations.firstWhere((loc) => loc.name == "Manchester");
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Departure Location
        ListTile(
          leading: Icon(Icons.radio_button_unchecked_rounded, color: BlaColors.neutralLight),
          title: Text(
            departure?.name ?? "Leaving from",
            style: BlaTextStyles.label.copyWith(
              color: departure != null ? BlaColors.neutralDark : BlaColors.neutralLight,
            ),
          ),
          trailing: GestureDetector(
            onTap: _swapLocations, // Swap locations when tapped
            child: Icon(Icons.swap_vert, color: BlaColors.primary),
          ),
          onTap: () {
            // TODO: Implement location picker
          },
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: BlaDivider(),
        ),

        // Arrival Location
        ListTile(
          leading: Icon(Icons.radio_button_unchecked_rounded, color: BlaColors.neutralLight),
          title: Text(
            arrival?.name ?? "Going to",
            style: BlaTextStyles.label.copyWith(
              color: arrival != null ? BlaColors.neutralDark : BlaColors.neutralLight,
            ),
          ),
          onTap: () {
            // TODO: Implement location picker
          },
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: BlaDivider(),
        ),

        // Date Selection
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

        // Number of Seats
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
                // TODO: Implement search functionality
              },
            ),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(body: RidePrefForm()),
    );
  }
}
