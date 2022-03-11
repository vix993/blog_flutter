import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/features/domain/usecases/get_blog_post_usecase.dart';

void main() {
  GetBlogPostUsecase usecase;
  IBlogPostRepository repository;

  setUp(() {
    usecase = GetBlogPostUsecase();
  });

  test("should get a list of blog post entities from the repository", () {

  });
}