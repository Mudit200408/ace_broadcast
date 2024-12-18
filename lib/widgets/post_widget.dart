import 'package:ace_broadcast/model/post_model.dart';
import 'package:ace_broadcast/pages/user/home_page/post_details.dart';
import 'package:ace_broadcast/widgets/post_content.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'post_header.dart';
import 'post_reactions.dart';

class PostWidget extends StatelessWidget {
  final PostModel post;

  const PostWidget({super.key, required this.post});

  Future<void> _sharePost() async {
    try {
      String shareText = post.postTitle;

      if (post.description.isNotEmpty) {
        shareText += '\n\n${post.description}';
      }

      if (post.postImage != null && post.postImage!.isNotEmpty) {
        shareText += '\n\nImage: ${post.postImage}';
      }

      await Share.share(
        shareText,
        subject: post.postTitle,
      );
    } catch (e) {
      debugPrint('Error in _sharePost: $e');
    }
  }

  void _navigateToDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostDetailsPage(post: post),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetails(context),
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostHeader(
              avatar: post.avatar,
              userName: post.userName,
              time: post.time,
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {},
              child: PostContent(
                postTitle: post.postTitle,
                postImage: post.postImage,
                description: post.description,
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {},
              child: PostReactions(
                likesCount: post.likesCount,
                commentsCount: post.commentsCount,
                shareCount: post.shareCount,
                onShare: _sharePost,
                onComments: () {
                  // Todo
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
