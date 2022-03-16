import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/core/http_client/http_implementation.dart';
import 'package:my_app/features/data/datasources/blog_post_datasource_implementation.dart';
import 'package:my_app/features/data/repositories/blog_post_repository_implemantation.dart';
import 'package:my_app/features/domain/usecases/get_blog_post_usecase.dart';
import 'package:my_app/features/presenter/controllers/home_store.dart';

import 'package:my_app/features/presenter/pages/home_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => HomeStore(i())),
    Bind.lazySingleton((i) => GetBlogPostUsecase(i())),
    Bind.lazySingleton((i) => BlogPostRepositoryImplementation(i())),
    Bind.lazySingleton((i) => BlogPostDatasourceImplementation(i())),
    Bind.lazySingleton((i) => HttpImplementation()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => HomePage()),
  ];
}