import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;
  final Color color;

  Category({required this.name, required this.icon, required this.color});
}

final List<Category> categories = [
  Category(
      name: 'Technical Competitions', icon: Icons.code, color: Colors.blue),
  Category(
      name: 'Fun and Festive',
      icon: Icons.celebration,
      color: Colors.deepPurple),
  Category(
      name: 'Cultural Performances',
      icon: Icons.theater_comedy,
      color: Colors.pink),
  Category(name: 'Art and Creativity', icon: Icons.brush, color: Colors.orange),
  Category(
      name: 'Sports & Athletics',
      icon: Icons.sports_soccer,
      color: Colors.green),
  Category(
      name: 'Gaming & Esports',
      icon: Icons.videogame_asset,
      color: Colors.red),
  Category(
      name: 'Entrepreneurship & Business',
      icon: Icons.business_center,
      color: Colors.purple),
  Category(name: 'Others', icon: Icons.category, color: Colors.blueGrey),
];
