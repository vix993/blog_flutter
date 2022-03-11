import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/core/usecase/errors/exceptions.dart';
import 'package:my_app/core/usecase/errors/failures.dart';
import 'package:my_app/features/data/datasources/blog_post_datasource.dart';
import 'package:my_app/features/data/models/blog_post_model.dart';
import 'package:my_app/features/data/repositories/blog_post_repository_implemantation.dart';

class MockBlogPostDatasource extends Mock implements IBlogPostDatasource {}
void main() {
  late BlogPostRepositoryImplementation repository;
  late IBlogPostDatasource datasource;

  setUp(() {
    datasource = MockBlogPostDatasource();
    repository = BlogPostRepositoryImplementation(datasource);
  });

  final tBlogPostModel = BlogPostModel(title: "hello", body: "world", userId: 1, id: 1);

  test("should return a List of Blog Post Model when it calls the datasource", () async {
    //Arrange
    when(datasource).calls(#getBlogPosts)
      .thenAnswer((_) async => tBlogPostModel);
    //Act
    final result = await repository.getBlogPosts();
    //Assert
    expect(result, Right(tBlogPostModel));
    verify(datasource).called(#getBlogPosts).withArgs();
  });
  test("should return a server failure when datasource is called and is unsuccessful", () async {
    //Arrange
    when(datasource).calls(#getBlogPosts)
      .thenThrow(ServerException());
    //Act
    final result = await repository.getBlogPosts();
    //Assert
    expect(result, Left(ServerFailure()));
    verify(datasource).called(#getBlogPosts).withArgs();
  });
}