import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/favorite_page.dart';
import '../providers/favorite_provider.dart';

class FavoriteComponent extends StatelessWidget {
  const FavoriteComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = context.watch<FavoriteProvider>();
    final count = favoriteProvider.favorites.length;

    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const FavoritePage(),
              ),
            );
          },
          icon: const Icon(Icons.favorite),
        ),
        if (count > 0)
          Positioned(
            top: 6,
            right: 6,
            child: CircleAvatar(
              radius: 10,
              backgroundColor: Colors.red,
              child: Text(
                '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

