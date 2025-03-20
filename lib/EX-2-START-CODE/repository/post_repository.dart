import 'package:week_3_blabla_project/EX-2-START-CODE/model/post.dart';

abstract class PostRepository {
  Future<List<Post>> getPost(int postId);
}
