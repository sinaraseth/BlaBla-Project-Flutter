import 'package:flutter/material.dart';

import 'package:week_3_blabla_project/EX-2-START-CODE/model/post.dart';
import 'package:week_3_blabla_project/EX-2-START-CODE/repository/post_repository.dart';
import 'async_value.dart';

class PostProvider extends ChangeNotifier {
  final PostRepository _repository;

  AsyncValue<List<Post>>? postValue;

  PostProvider({required PostRepository repository}) : _repository = repository;

  void fetchPost(int postId) async {
    // 1-  Set loading state
    postValue = AsyncValue.loading();
    notifyListeners();

    try {
      List<Post> post = await _repository.getPost(postId);
      if (post.isEmpty) {
        postValue = AsyncValue.empty();
      } else {
        // 3  Set success state
        postValue = AsyncValue.success(post);
      }
    } catch (error) {
      // 4  Set error state
      postValue = AsyncValue.error(error);
    }

    notifyListeners();
  }
}
