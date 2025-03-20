import 'package:week_3_blabla_project/Practice W6/model/post.dart';
import 'package:week_3_blabla_project/Practice%20W6/repository/post_repository.dart';

class MockPostRepository extends PostRepository {
  @override
  Future<Post> getPost(int postId) {
    return Future.delayed(Duration(seconds: 3), () {
      if (postId == 25) {
        return Post(
            id: 25, title: 'Who is the best', description: 'Teacher Ronan');
      } else {
        throw Exception('catch error.');
      }
    });
  }
}
