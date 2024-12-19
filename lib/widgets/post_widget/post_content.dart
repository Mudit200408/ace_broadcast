import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class PostContent extends StatelessWidget {
  final String postTitle;
  final String? postImage;
  final String? description;

  const PostContent({
    super.key,
    required this.postTitle,
    this.postImage,
    this.description,
  });

  void _showExpandedImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.6, sigmaY: 0.3),
                  child: Container(
                    color: Colors.black.withOpacity(0.9),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: InteractiveViewer(
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.contain,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          postTitle,
          style: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        if (postImage != null)
          GestureDetector(
            onTap: () => _showExpandedImage(context, postImage!),
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(postImage!),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        if (description != null && postImage == null)
          Text(
            description!,
            style: GoogleFonts.lato(
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
      ],
    );
  }
}
