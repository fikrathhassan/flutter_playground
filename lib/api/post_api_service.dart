import 'package:flutter_playground/api/api.dart';

import '../data/model/post.dart';

class PostApiService extends Api {
  static const String posts = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> getPosts(int page, int limit) async {
    try {
      final response = await dio.get(
        posts,
        queryParameters: {'_page': page, '_limit': limit},
      );
      final List<dynamic> data = response.data;
      return data.map((json) => Post.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch posts');
    }
  }
}
