import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:my_app/features/domain/usecases/get_blog_post_usecase.dart';
import 'package:my_app/features/presenter/controllers/home_store.dart';
import 'package:my_app/features/presenter/widgets/custom_app_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    super.initState();
    store.getBlogPosts();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Blog Posts"),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                "Welcome to random blog posts",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.caption
              ),
              Observer(
                builder: (_) {
                  return Text('${store.blogPosts.value}');
                },
              ),
            ],
          )
        ),
      )
    );
  }
}