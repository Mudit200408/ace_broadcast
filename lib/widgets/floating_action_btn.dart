import 'dart:async';
import 'package:flutter/material.dart';

class RotatingFloatingActionButton extends StatefulWidget {
  final VoidCallback onPressed;

  const RotatingFloatingActionButton({super.key, required this.onPressed});

  @override
  _RotatingFloatingActionButtonState createState() =>
      _RotatingFloatingActionButtonState();
}

class _RotatingFloatingActionButtonState
    extends State<RotatingFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (mounted) {
        _controller
          ..reset()
          ..forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      height: 65,
      child: FloatingActionButton(
        onPressed: widget.onPressed,
        shape: const CircleBorder(),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _controller.value * 2 * 3.14159265359,
              child: child,
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
    );
  }
}
