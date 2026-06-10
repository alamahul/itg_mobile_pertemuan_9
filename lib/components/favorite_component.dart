import 'package:flutter/material.dart';
import 'package:itg_mobile_pertemuan_8/providers/favorite_provider.dart';
import 'package:provider/provider.dart';



class FavoriteComponent extends StatelessWidget {
  const FavoriteComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = context.watch<FavoriteProvider>();
    final count = favoriteProvider.favorites.length;
    return Stack(
      alignment: Alignment.center,
      children:[
        const IconButton(
          onPressed: null,
          icon: Icon(Icons.favorite),
        ),
        if (count > 0) 
          Positioned(
            top: 6,
            right: 6,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.red,
              child: Text(
                 '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          )
      ]
    );
  }
}

