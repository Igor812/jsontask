import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Post> fetchPost() async {
  final response = await http.
  get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
  
  if(response.statusCode==200) {
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Ошибка выгрузки данных");
  }
  
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

}

