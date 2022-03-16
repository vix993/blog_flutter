import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/features/data/models/blog_post_model.dart';
import 'package:my_app/features/domain/entities/blog_post_entity.dart';

import '../../../mocks/blog_post_mock.dart';

void main() {
  final tBlogPostModel = BlogPostModel(
    title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
    userId: 1,
    id: 1
  );

  test('should return a valid model', () {
    // Arrange
    final List<dynamic> list = json.decode(blogPostMock);

    // Act
    final result = BlogPostModel.fromJson(list[0]);
    // Assert
    expect(result, tBlogPostModel);
  });

  test('should return a json map containing the proper data', () {
    // Arrange
    final expectedMap = {
      "userId": 1,
      "id": 1,
      "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
    };
    // Act
    final result = tBlogPostModel.toJson();
    // Assert
    expect(result, expectedMap);
  });
}