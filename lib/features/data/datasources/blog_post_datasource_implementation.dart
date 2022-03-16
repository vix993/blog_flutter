import 'dart:convert';

import 'package:my_app/core/http_client/http_client.dart';
import 'package:my_app/core/usecase/errors/exceptions.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/data/datasources/blog_post_datasource.dart';
import 'package:my_app/features/data/datasources/endpoints/blog_post_endpoint.dart';
import 'package:my_app/features/data/models/blog_post_model.dart';

class BlogPostDatasourceImplementation implements IBlogPostDatasource{
  final HttpClient client;

  BlogPostDatasourceImplementation(this.client);
  @override
  Future<List<BlogPostModel>> getBlogPosts() async {
    final response = await client.get(BlogPostEndpoints.blogPost());
    if (response.statusCode == 200) {
      List<BlogPostModel> parsedResponse = [];
      List<dynamic> jsonArray = json.decode(response.data);
      jsonArray.forEach((blogPost) {
        parsedResponse.add(BlogPostModel.fromJson(blogPost));
      });
      return parsedResponse;
    } else {
      throw ServerException();
    }
  }
}