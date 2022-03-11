import 'package:equatable/equatable.dart';

class BlogPosts extends Equatable {
  final String title;
  final String body;

  BlogPosts({required this.title, required this.body});

  @override
  List<Object> get props => [
    title,
    body,
  ];
}