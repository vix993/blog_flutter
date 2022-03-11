import 'package:my_app/features/data/models/blog_post_model.dart';

abstract class IBlogPostDatasource {

  Future<BlogPostModel> getBlogPosts();
}