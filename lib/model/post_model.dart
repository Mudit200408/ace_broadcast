class PostModel {
  final String avatar;
  final String userName;
  final String postTitle;
  final String time;
  final String? postImage;
  final String description;
  final int likesCount;
  final int commentsCount;
  final int shareCount;
  final bool applicablePost;

  PostModel({
    required this.avatar,
    required this.userName,
    required this.postTitle,
    required this.time,
    this.postImage,
    required this.description,
    required this.likesCount,
    required this.commentsCount,
    required this.shareCount,
    required this.applicablePost,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      avatar: map['avatar'] ?? '',
      userName: map['userName'] ?? '',
      postTitle: map['postTitle'] ?? '',
      time: map['time'] ?? '',
      postImage: map['postImage'],
      description: map['description'] ?? '',
      likesCount: int.parse(map['likesCount'].toString()),
      commentsCount: int.parse(map['commentsCount'].toString()), 
      shareCount: int.parse(map['shareCount'].toString()), 
      applicablePost: map['applicablePost'] ?? false,
    );
  }
}
