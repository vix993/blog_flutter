import 'package:dartz/dartz.dart';
import 'package:my_app/core/usecase/errors/failures.dart';
import 'package:my_app/features/domain/entities/blog_post_entity.dart';

abstract class IBlogPostRepository {
  Future<Either<Failure, List<BlogPostEntity>>> getBlogPosts();
}