import 'package:equatable/equatable.dart';

import '../../data/model/post.dart';

abstract class PostState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;
  final bool hasMore;

  PostLoaded(this.posts, this.hasMore);

  @override
  List<Object?> get props => [posts, hasMore];
}

class PostError extends PostState {
  final String message;

  PostError(this.message);

  @override
  List<Object?> get props => [message];
}
