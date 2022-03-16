import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:my_app/core/usecase/errors/failures.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/data/models/blog_post_model.dart';
import 'package:my_app/features/domain/usecases/get_blog_post_usecase.dart';

class HomeStore {
  final GetBlogPostUsecase usecase;
  final blogPosts = Observable([]);
  final isLoading = Observable(false);

  HomeStore(this.usecase);

  getBlogPosts() async {
    isLoading.value = true;
    final noParams = NoParams();
    final result = await usecase(noParams);
    result.fold((err) => blogPosts.value = [err], (success) => blogPosts.value = success);
    blogPosts.value.add(result);
    isLoading.value = false;
  }
}