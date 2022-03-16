import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/core/usecase/errors/failures.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/blog_post_entity.dart';
import 'package:my_app/features/domain/repositories/blog_post_repository.dart';
import 'package:my_app/features/domain/usecases/get_blog_post_usecase.dart';

import '../../../mocks/blog_posts_entity_mock.dart';

class MockBlogPostRepository extends Mock implements IBlogPostRepository {}
void main() {
  late GetBlogPostUsecase usecase;
  late IBlogPostRepository repository;

  setUp(() {
    repository = MockBlogPostRepository();
    usecase = GetBlogPostUsecase(repository);
  });


  final tNoParams = NoParams();

  test("should get a list of blog post entities from the repository", () async {
    when(repository)
      .calls(#getBlogPosts)
      .thenAnswer((_) async => Right<Failure,List<BlogPostEntity>>(tBlogPost));
    final result = await usecase(tNoParams);
    expect(result, Right(tBlogPost));
    verify(repository).called(#getBlogPosts).withArgs().once();
  });

  test("should fail when getting blog post entities from repository", () async {
    when(repository)
      .calls(#getBlogPosts)
      .thenAnswer(
        (_) async => Left<Failure,List<BlogPostEntity>>(ServerFailure()));
    final result = await usecase(tNoParams);
    expect(result, Left(ServerFailure()));
    verify(repository).called(#getBlogPosts).withArgs().once();
  });
}