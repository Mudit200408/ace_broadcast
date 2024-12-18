import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter/material.dart';
import 'create_post_team.dart';

class FindTeammatesPage extends StatefulWidget {
  const FindTeammatesPage({super.key});

  @override
  State<FindTeammatesPage> createState() => _FindTeammatesPageState();
}

class _FindTeammatesPageState extends State<FindTeammatesPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  void _openCreatePost() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    final Offset centerOffset = Offset(size.width, size.height);

    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return CircularRevealAnimation(
            animation: animation,
            centerOffset: centerOffset,
            child: const CreatePostPage(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Teammates'),
      ),
      body: const Center(
        child: Text('Find Teammates Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openCreatePost,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
