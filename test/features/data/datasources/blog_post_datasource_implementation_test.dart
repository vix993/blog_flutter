import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/core/http_client/http_client.dart';
import 'package:my_app/core/usecase/errors/exceptions.dart';
import 'package:my_app/features/data/datasources/blog_post_datasource.dart';
import 'package:my_app/features/data/datasources/blog_post_datasource_implementation.dart';
import 'package:my_app/features/data/models/blog_post_model.dart';

import '../../../mocks/blog_post_mock.dart';

class HttpClientMock extends Mock implements HttpClient {

}
void main() {
  late IBlogPostDatasource datasource;
  late HttpClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = BlogPostDatasourceImplementation(client);
  });

  final urlExpected = 'https://jsonplaceholder.typicode.com/posts';

  void successMock() {
    when(client).calls(#get).thenAnswer((_) async => HttpResponse(data: blogPostMock, statusCode: 200));
  }

  test('should call the get method with correct url', () async {
    // Arrange
    successMock();
    // Act
    await datasource.getBlogPosts();
    // Assert
    verify(client).called(#get).withArgs();
  });

  test('should return a List of BlogPost Models when successful', () async {
    // Arrange
    successMock();
    final List<dynamic> tBlogBlogModelListMock = json.decode(blogPostMock);
    final List<BlogPostModel> tBlogPostListExpected = [];
    tBlogBlogModelListMock.forEach((blogPost) {
      tBlogPostListExpected.add(BlogPostModel.fromJson(blogPost));
    });
    // Act
    final result = await datasource.getBlogPosts();
    // Assert
    expect(result.length, tBlogPostListExpected.length);
    expect(result, tBlogPostListExpected);
  });

  test('should throw a ServerException when the call is unsuccessful', () async {
    // Arrange
    when(client).calls(#get).thenAnswer((_) async => HttpResponse(data: 'something went wrong', statusCode: 400));
    // Act
    final result = datasource.getBlogPosts();
    //Assert
    expect(() => result, throwsA(ServerException()));
  });
}