import 'package:my_app/features/data/models/blog_post_model.dart';

abstract class IBlogPostDatasource {

  Future<List<BlogPostModel>> getBlogPosts();
}