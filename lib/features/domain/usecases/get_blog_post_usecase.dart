import 'package:dartz/dartz.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/domain/entities/blog_post_entity.dart';

import '../../../core/usecase/errors/failures.dart';
import '../repositories/blog_post_repository.dart';

class GetBlogPostUsecase implements Usecase<BlogPostEntity,NoParams> {
  final IBlogPostRepository repository;

  GetBlogPostUsecase(this.repository);
  
  @override
  Future<Either<Failure, BlogPostEntity>> call(NoParams params) async {
    return await repository.getBlogPosts();
  }
}