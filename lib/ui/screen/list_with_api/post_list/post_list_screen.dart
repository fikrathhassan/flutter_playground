import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_playground/bloc/post/post_event.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../bloc/post/post_bloc.dart';
import '../../../../bloc/post/post_state.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({super.key});

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    final postBloc = context.read<PostBloc>();
    postBloc.add(GetPosts(page: postBloc.initialPage));
  }

  @override
  Widget build(BuildContext context) {
    final postBloc = context.read<PostBloc>();

    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostError) {
            showToast(state.message);
          }
          if (state is PostLoading && postBloc.page == postBloc.initialPage) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.builder(
              controller: _scrollController,
              itemCount: state.posts.length + (state.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < state.posts.length) {
                  final post = state.posts[index];
                  return ListTile(
                    title: Text(post.title ?? "N/A"),
                    subtitle: Text(post.body ?? "N/A"),
                    onTap: () => showToast(post.id.toString()),
                  );
                } else {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            );
          }
          return Center(child: Text('No Data'));
        },
      ),
    );
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      final postBloc = context.read<PostBloc>();
      if ((postBloc.state as PostLoaded).hasMore) {
        postBloc.add(GetPosts(page: postBloc.page));
      }
    }
  }

  void showToast(String? message) {
    Fluttertoast.showToast(
      msg: message ?? "",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
