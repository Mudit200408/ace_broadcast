import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'bottom_menu.dart';

class PostHeader extends StatelessWidget {
  final String avatar;
  final String userName;
  final String time;

  const PostHeader({
    super.key,
    required this.avatar,
    required this.userName,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 15,
          backgroundImage: NetworkImage(avatar),
        ),
        const SizedBox(width: 8),
        Text(
          userName,
          style: GoogleFonts.lato(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          time,
          style: GoogleFonts.lato(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => const BottomMenu(),
            );
          },
          child: const Icon(Iconsax.more, size: 22),
        ),
      ],
    );
  }
}
