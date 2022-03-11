import 'package:equatable/equatable.dart';

class ServerException extends Equatable implements Exception {
  final String message = "something went wrong";
  @override
  List<Object> get props => [message];
}