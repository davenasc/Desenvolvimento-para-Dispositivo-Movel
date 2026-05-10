import 'dart:convert';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body);

  String toJson() {
    Map<String, dynamic> input = {
      "userId": this.userId,
      "id": this.id,
      "title": this.title,
      "body": this.body,
    };
    return jsonEncode(input);
  }

  static Post fromJson(Map<String, dynamic> item) {
    return Post(item['userId'], item['id'], item['title'], item['body']);
  }
}
