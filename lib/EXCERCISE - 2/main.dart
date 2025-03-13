import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week_3_blabla_project/EXCERCISE - 2/models/color_counters.dart';
import 'package:week_3_blabla_project/EXCERCISE - 2/screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorCounters(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    ),
  );
}


//using setstate: When something changes in the app, the whole widget tree is rebuilt. example when inside colorTapScreen, every tap courses a rebuild of both widgets, even when only one is tapped.

//using provider with change notifier: When a button is tapped: Only the corresponding ColorTap widget rebuilds (red or blue). The other color tap remains unchanged