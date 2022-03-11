import 'dart:ffi';

import 'package:equatable/equatable.dart';

class BlogPostEntity extends Equatable {
  final String title;
  final String body;
  final Int userId;
  final Int id;

  BlogPostEntity({
    required this.title,
    required this.body,
    required this.userId,
    required this.id
  });

  @override
  List<Object> get props => [
    title,
    body,
  ];
}