import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:iconsax/iconsax.dart';

class PostReactions extends StatelessWidget {
  final int likesCount;
  final int commentsCount;
  final int shareCount;
  final VoidCallback onShare;
  final VoidCallback onComments;

  const PostReactions({
    super.key,
    required this.likesCount,
    required this.commentsCount,
    required this.shareCount,
    required this.onShare,
    required this.onComments,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            LikeButton(
              size: 20,
              likeCount: likesCount,
              likeBuilder: (bool isLiked) {
                return Icon(
                  isLiked ? Icons.favorite : Iconsax.heart,
                  color:
                      isLiked ? Colors.red : Theme.of(context).iconTheme.color,
                  size: 20,
                );
              },
              countBuilder: (int? count, bool isLiked, String text) {
                return Text(
                  text,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                );
              },
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: onComments,
              child: Row(
                children: [
                  const Icon(Iconsax.message_text, size: 20),
                  const SizedBox(width: 4),
                  Text(commentsCount.toString()),
                ],
              ),
            ),
            const SizedBox(width: 20),
            GestureDetector(
              onTap: onShare,
              child: Row(
                children: [
                  const Icon(Iconsax.send_2, size: 20),
                  const SizedBox(width: 4),
                  Text(shareCount.toString()),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
