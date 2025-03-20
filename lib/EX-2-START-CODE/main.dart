import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/providers/post_provider.dart';
import 'ui/screens/post_screen.dart';
import 'package:week_3_blabla_project/EX-2-START-CODE/repository/http_post_repository.dart';

void main() {
  // 1- Create the repository
  HttpPostRepository httpPostRepo = HttpPostRepository();

  // 2 - Run the UI
  runApp(
    ChangeNotifierProvider(
      // create: (context) => PostProvider(repository: postRepo),
      create: (context) => PostProvider(httpPostRepo: httpPostRepo),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: PostScreen()),
    ),
  );
}
