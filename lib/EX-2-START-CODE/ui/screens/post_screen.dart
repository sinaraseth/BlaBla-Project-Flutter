import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:week_3_blabla_project/EX-2-START-CODE/model/post.dart';
import 'package:week_3_blabla_project/EX-2-START-CODE/ui/providers/async_value.dart';
import 'package:week_3_blabla_project/EX-2-START-CODE/ui/providers/post_provider.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //  1 - Get the post provider
    final PostProvider postProvider = Provider.of<PostProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            // 2- Fetch the post
            onPressed: () => {postProvider.fetchPost(25)},
            icon: const Icon(Icons.update),
          ),
        ],
      ),

      // 3 -  Display the post
      body: Center(child: _buildBody(postProvider)),
    );
  }

  Widget _buildBody(PostProvider courseProvider) {
    final postValue = courseProvider.postValue;

    if (postValue == null) {
      return Text('Tap refresh to display post'); // display an empty state
    }

    switch (postValue.state) {
      case AsyncValueState.loading:
        return CircularProgressIndicator(); // display a progress

      case AsyncValueState.error:
        return Text('Error: ${postValue.error}'); // display a error

      case AsyncValueState.success:
        return PostCard(post: postValue.data!); // display the post

      case AsyncValueState.empty:
         return Text('No Post for now');
    }
  }
}

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final List<Post> post;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
       itemCount: post.length,
       itemBuilder: (context, index) {
         return ListTile(
           title: Text(post[index].title),
           subtitle: Text(post[index].description),
         );
       },
     );
  }
}
