import 'package:my_app/features/domain/entities/blog_post_entity.dart';

class BlogPostModel extends BlogPostEntity {
  BlogPostModel({
    required String title,
    required String body,
    required int userId,
    required int id})
    : super(
      title: title,
      body: body,
      userId: userId,
      id: id
    );

  factory BlogPostModel.fromJson(Map<String, dynamic> json) =>
    BlogPostModel(
      title: json['title'], body: json['body'], userId: json['userId'], id: json['id']
    );

  Map<String,dynamic> toJson() => {
    'body': body,
    'title': title,
    'userId': userId,
    'id': id
  };
}