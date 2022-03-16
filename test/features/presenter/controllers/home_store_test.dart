import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_app/features/domain/usecases/get_blog_post_usecase.dart';
import 'package:my_app/features/presenter/controllers/home_store.dart';

import '../../../mocks/blog_posts_entity_mock.dart';

class MockGetBlogPostUsecase extends Mock implements GetBlogPostUsecase {}
void main () {
  late HomeStore store;
  late GetBlogPostUsecase mockUsecase;

  setUp(() {
    mockUsecase = MockGetBlogPostUsecase();
    store = HomeStore(mockUsecase);
  });

  // test('should return a BlogPost from the usecase', () async {
  //   // Arrange
  //   when(() => mockUsecase(any())).thenAnswer((_) async => Right(tBlogPost));
  //   // Act
  //   await store.getBlogPosts();
  //   // Assert
  //   expect(store.blogPosts.value, tBlogPost);
  // });
}