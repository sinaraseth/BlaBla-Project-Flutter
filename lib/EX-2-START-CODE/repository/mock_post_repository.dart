import 'package:week_3_blabla_project/EX-2-START-CODE/model/post.dart';

import 'post_repository.dart';

class MockPostRepository extends PostRepository {
  List<Post> post = [
    // Post(id: 26, title: "Who is the king", description: 'ronnan'),
    // Post(id: 25, title: 'Who is the best', description: 'teacher ronan'), 
   ];
  @override
  Future<List<Post>> getPost(int postId) {
    return Future.delayed(Duration(seconds: 5), () {
      if (postId != 25) {
        throw Exception("No post found");
      }
       return post;
    });
  }
}
