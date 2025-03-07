class Post {
  final int? id;
  final String? title;
  final String? body;

  Post({
    this.id,
    this.title,
    this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int?,
      title: json['title'] as String?,
      body: json['body'] as String?,
    );
  }

  // Method for converting a Post instance to a map
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
    };
  }
}