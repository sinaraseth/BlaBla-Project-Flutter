// ignore_for_file: avoid_print
import 'package:week_3_blabla_project/Practice%20W6/model/post.dart';
import 'package:week_3_blabla_project/Practice%20W6/repository/mock_post_repository.dart';
import 'package:week_3_blabla_project/Practice%20W6/repository/post_repository.dart';

void main() {
  // 1- Create the repo
  PostRepository mockPostRepo = MockPostRepository();

  // 2- Request the post  - Success
  print("Fetching post 25...");
  mockPostRepo
      .getPost(25)
      .then((post) => {
            print(
                "Post : title ${post.title}, description: description ${post.description}")
          })
      .catchError((error) => {print("Error hzz: $error")});

  // 3- Request the post - Failed

  // TODO
}
