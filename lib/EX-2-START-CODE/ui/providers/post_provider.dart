import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:week_3_blabla_project/EX-2-START-CODE/model/post.dart';
import 'async_value.dart';
import 'package:week_3_blabla_project/EX-2-START-CODE/dto/post_dto.dart';
import 'package:week_3_blabla_project/EX-2-START-CODE/repository/http_post_repository.dart';

class PostProvider extends ChangeNotifier {
  //final PostRepository _repository;
  final HttpPostRepository _httpPostRepository;
  AsyncValue<Post>? postValue;

  // PostProvider({required PostRepository repository}) : _repository = repository;
  PostProvider({required HttpPostRepository httpPostRepo})
      : _httpPostRepository = httpPostRepo;
  void fetchPost(Uri url) async {
    // 1-  Set loading state
    postValue = AsyncValue.loading();
    notifyListeners();

    try {
     // List<Post> post = await _repository.getPost(postId);
       final postDto = PostDto(link: url);
       final response = await postDto.getHttp();
       final json = jsonDecode(response);
       Map<String, dynamic> jsonData = json[0];
 
       Post post = await _httpPostRepository.fromJson(jsonData);
       // if (post.isEmpty) {
       //   postValue = AsyncValue.empty();
       // } else {
       //   // 3  Set success state
       //   postValue = AsyncValue.success(post);
       // }
       postValue = AsyncValue.success(post);
    } catch (error) {
      // 4  Set error state
      postValue = AsyncValue.error(error);
    }

    notifyListeners();
  }
}
