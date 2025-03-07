import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/api/post_api_service.dart';
import 'package:flutter_playground/bloc/post/post_event.dart';
import 'package:flutter_playground/bloc/post/post_state.dart';
import 'package:flutter_playground/data/model/post.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostApiService apiService;
  final int initialPage = 1;
  final int limit = 10;
  final List<Post> allPosts = [];
  int page = 1;
  bool hasMore = true;

  PostBloc(this.apiService) : super(PostInitial()) {
    on<GetPosts>((event, emit) async {
      print("GetPosts");

      if (page == initialPage) {
        allPosts.clear();
        emit(PostLoading());
      }

      try {
        final posts = await apiService.getPosts(page, limit);
        allPosts.addAll(posts);

        if (posts.isNotEmpty) {
          page++;
        } else {
          hasMore = false;
        }
        emit(PostLoaded(List.from(allPosts), hasMore));
      } catch (e) {
        emit(PostError('Failed to fetch posts'));
      }
    });
  }
}
