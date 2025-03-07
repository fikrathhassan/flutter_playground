import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetPosts extends PostEvent {
  final int page;
  final int limit;

  GetPosts({required this.page, this.limit = 10});

  @override
  List<Object> get props => [page, limit];
}
