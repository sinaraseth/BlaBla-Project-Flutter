import 'package:flutter/foundation.dart';
import 'package:week_3_blabla_project/EX-1-START-CODE/models/course.dart';
import 'package:week_3_blabla_project/EX-1-START-CODE/repositories/courses_repository.dart';

class CoursesProvider with ChangeNotifier {
  final CoursesRepository _repository;

  CoursesProvider(this._repository);

  List<Course> getCourses() {
    return _repository.getCourses();
  }

  Course getCourseFor(String courseId) {
    return _repository
        .getCourses()
        .firstWhere((course) => course.name == courseId);
  }

  void addScore(String courseId, CourseScore score) {
    final course = getCourseFor(courseId);
    _repository.addScore(course, score);
    notifyListeners();
  }

  void deleteCourse(String courseId) {
    _repository.deleteCourse(courseId);
    notifyListeners();
  }
}
