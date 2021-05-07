import 'dart:convert';

import 'package:hobby_hub_ui/controller/user_controller.dart';
import 'package:hobby_hub_ui/models/comment_model.dart';
import 'package:hobby_hub_ui/models/post.dart';
import 'package:hobby_hub_ui/models/user_model.dart';
import 'package:hobby_hub_ui/network/post_api.dart';

class PostController {
  static List<Post> feed;
  static List<Post> trending;

  Future<List<Post>> getUserFeed() async {
    feed = _parsePosts(await PostApi().getFeed());
    return feed;
  }

  Future<List<Post>> getOwnedPostsByUsername(String username) async {
    User user = await UserController().getUserByUsername(username);
    List<Post> ownedPosts = [];
    for (var postId in user.posts) {
      ownedPosts.add(await getPostByPostId(postId));
    }
    return ownedPosts;
  }

  Future<List<Post>> getUserTrending() async {
    trending = _parsePosts(await PostApi().getTrending());
    return trending;
  }

  Future<bool> post(Post post) async {
    return await PostApi().post(post);
  }

  Future<Post> getPostByPostId(String postId) async {
    return _parsePost(await PostApi().getPost(postId));
  }

  Future<bool> comment(String postId, Comment comment) async {
    return await PostApi().addComment(postId, comment);
  }

  Future<bool> like(String postId) async {
    return await PostApi().like(postId);
  }

  Future<bool> unlike(String postId) async {
    return await PostApi().removeLike(postId);
  }

  List<Post> _parsePosts(String res) {
    try {
      Iterable itr = json.decode(res);
      return List<Post>.from(itr.map((model) => Post.fromJson(model)));
    } catch (e) {
      print("JsonParser parsePosts error");
      print(e.toString());
      return [];
    }
  }

  Post _parsePost(String res) {
    try {
      return Post.fromJson(jsonDecode(res));
    } catch (e) {
      print("JsonParser parsePost error");
      print(e.toString());
      return null;
    }
  }
}