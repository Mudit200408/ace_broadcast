import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:iconsax/iconsax.dart';

class PostReactions extends StatelessWidget {
  final int likesCount;
  final int commentsCount;
  final int shareCount;
  final VoidCallback onShare;
  final VoidCallback onComments;
  final bool isApplicable;

  const PostReactions({
    super.key,
    required this.likesCount,
    required this.commentsCount,
    required this.shareCount,
    required this.onShare,
    required this.onComments,
    required this.isApplicable,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        LikeButton(
          size: 20,
          likeCount: likesCount,
          likeBuilder: (bool isLiked) {
            return Icon(
              isLiked ? Iconsax.heart5 : Iconsax.heart,
              color: isLiked ? Colors.red : Theme.of(context).iconTheme.color,
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
        const Spacer(),
        Visibility(
          visible: isApplicable,
          child: SizedBox(
            width: 85,
            height: 30,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: isDarkMode
                    ? Colors.grey.shade900
                    : Theme.of(context).colorScheme.surface,
                side: isDarkMode
                    ? BorderSide.none
                    : BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                        width: 1.8),
              ),
              child: Text(
                'Apply',
                style: GoogleFonts.lato(
                  color: isDarkMode
                      ? Colors.white
                      : Theme.of(context).colorScheme.primary,
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
