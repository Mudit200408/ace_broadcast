import 'package:flutter/material.dart';

class Category {
  final int index;
  final String name;
  final IconData icon;
  final Color color;

  Category(
      {required this.index,
      required this.name,
      required this.icon,
      required this.color});
}

final List<Category> categories = [
  Category(
      index: 1,
      name: 'Technical Competitions',
      icon: Icons.code,
      color: Colors.blue),
  Category(
      index: 2,
      name: 'Fun and Festive',
      icon: Icons.celebration,
      color: Colors.deepPurple),
  Category(
      index: 3,
      name: 'Cultural Performances',
      icon: Icons.theater_comedy,
      color: Colors.pink),
  Category(
      index: 4,
      name: 'Art and Creativity',
      icon: Icons.brush,
      color: Colors.orange),
  Category(
      index: 5,
      name: 'Sports & Athletics',
      icon: Icons.sports_soccer,
      color: Colors.green),
  Category(
      index: 6,
      name: 'Gaming & Esports',
      icon: Icons.videogame_asset,
      color: Colors.red),
  Category(
      index: 7,
      name: 'Entrepreneurship & Business',
      icon: Icons.business_center,
      color: Colors.purple),
  Category(
      index: 8, name: 'Others', icon: Icons.category, color: Colors.blueGrey),
];
