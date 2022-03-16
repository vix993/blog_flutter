import 'package:dartz/dartz.dart';
import 'package:my_app/core/usecase/errors/exceptions.dart';
import 'package:my_app/core/usecase/errors/failures.dart';
import 'package:my_app/features/domain/entities/blog_post_entity.dart';
import 'package:my_app/features/domain/repositories/blog_post_repository.dart';

import '../datasources/blog_post_datasource.dart';

class BlogPostRepositoryImplementation implements IBlogPostRepository {
  final IBlogPostDatasource datasource;

  BlogPostRepositoryImplementation(this.datasource);
  
  @override
  Future<Either<Failure,List<BlogPostEntity>>> getBlogPosts() async {
    try {
      final result = await datasource.getBlogPosts();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}