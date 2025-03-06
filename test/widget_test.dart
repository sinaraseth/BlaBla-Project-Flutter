import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/W3%20-%20Practice/theme/theme.dart';
import 'package:week_3_blabla_project/W3%20-%20Practice/widgets/inputs/location_picker.dart';

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
      home: Scaffold(body: LocationPicker(onLocationSelected: (Location ) {  },)),
    );
  }
}
