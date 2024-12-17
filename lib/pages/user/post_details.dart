import 'package:ace_broadcast/widgets/post_reactions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ace_broadcast/model/post_model.dart';
import 'package:iconsax/iconsax.dart';

class PostDetailsPage extends StatefulWidget {
  final PostModel post;

  const PostDetailsPage({super.key, required this.post});

  @override
  _PostDetailsPageState createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  final TextEditingController _commentController = TextEditingController();
  bool _isTextFieldEmpty = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Post Details',
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
          surfaceTintColor: Theme.of(context).colorScheme.surface,
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(widget.post.avatar),
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.post.userName,
                          style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          widget.post.time,
                          style: GoogleFonts.lato(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  widget.post.postTitle,
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (widget.post.postImage != null)
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 5),
                      child: SizedBox(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            widget.post.postImage!,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 5),
                Text(
                  widget.post.description,
                  style: GoogleFonts.lato(
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                Divider(
                  color: Theme.of(context).colorScheme.surfaceDim,
                  thickness: 0.3,
                ),
                const SizedBox(height: 10),
                PostReactions(
                    likesCount: widget.post.likesCount,
                    commentsCount: widget.post.commentsCount,
                    shareCount: widget.post.shareCount,
                    onShare: () {},
                    onComments: () {}),
                const SizedBox(height: 10),
                Divider(
                  color: Theme.of(context).colorScheme.surfaceDim,
                  thickness: 0.3,
                ),
                const SizedBox(height: 10),
                Text(
                  'Comments',
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 8,
                                backgroundImage:
                                    NetworkImage(widget.post.avatar),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "userName",
                                style: GoogleFonts.lato(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "2d",
                                style: GoogleFonts.lato(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'This is a comment.',
                            style: GoogleFonts.lato(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            border: Border(
              top: BorderSide(
                color: Colors.grey.shade500,
                width: 1.0,
              ),
            ),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.post.avatar),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: TextField(
                  controller: _commentController,
                  decoration: InputDecoration(
                    hintText: 'Add a comment...',
                    hintStyle: TextStyle(color: Theme.of(context).hintColor),
                    border: InputBorder.none,
                  ),
                  onChanged: (text) {
                    setState(() {
                      _isTextFieldEmpty = text.isEmpty;
                    });
                  },
                ),
              ),
              IconButton(
                icon: Icon(
                  _isTextFieldEmpty ? Iconsax.gallery : Iconsax.arrow_square_up,
                  // color: Colors.white,
                ),
                onPressed: () {
                  if (_isTextFieldEmpty) {
                    // Navigate to emoji board
                  } else {
                    // Send the comment
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
