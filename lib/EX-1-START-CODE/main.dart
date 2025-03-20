import 'package:flutter/material.dart';
import 'screens/courses_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:week_3_blabla_project/EX-1-START-CODE/repositories/courses_mock_repository.dart';
import 'package:week_3_blabla_project/EX-1-START-CODE/providers/courses_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
       create: (ctx) => CoursesProvider(CoursesMockRepository()),
       child: const MaterialApp(
         debugShowCheckedModeBanner: false,
         home: CourseListScreen(),
       ),
    );
  }
}
