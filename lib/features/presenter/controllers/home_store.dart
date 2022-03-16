import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart' as mobx;
import 'package:my_app/core/usecase/errors/failures.dart';
import 'package:my_app/core/usecase/usecase.dart';
import 'package:my_app/features/data/models/blog_post_model.dart';
import 'package:my_app/features/domain/usecases/get_blog_post_usecase.dart';

class HomeStore {
  final GetBlogPostUsecase usecase;
  var blogPosts = mobx.Observable([]);
  var isLoading = mobx.Observable(false);

  var counter = mobx.Observable(0);

  late mobx.Action increment;

  HomeStore(this.usecase) {
    increment = mobx.Action(_increment);
  }

  getBlogPosts() async {
    isLoading.value = true;
    final noParams = NoParams();
    final result = await usecase(noParams);
    result.fold((err) => blogPosts.value = [err], (success) => blogPosts.value = success);
    blogPosts.value.add(result);
    isLoading.value = false;
  }

  _increment() {
    counter.value = counter.value + 1;
  }
}