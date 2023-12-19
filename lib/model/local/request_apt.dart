import 'dart:convert';
import '../post.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
class apiRequest {
  static String url = 'http://192.168.1.5:3000/';


  static List<Post> parsePost(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Post> posts = list.map((model) => Post.fromJson(model)).toList();
    return posts;
  }

  static Future<List<Post>> fetchPosts({int page = 1}) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return compute(parsePost, response.body);
     } else if (response.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('Can\'t get post');
    }
  }
}