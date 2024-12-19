import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Iconsax.flag),
            title: const Text('Report'),
            onTap: () {
              // Handle report action
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Iconsax.send),
            title: const Text('Send'),
            onTap: () {
              // Handle send action
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Iconsax.bookmark),
            title: const Text('Bookmark'),
            onTap: () {
              // Handle bookmark action
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
