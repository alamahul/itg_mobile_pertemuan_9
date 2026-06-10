import 'package:flutter/material.dart';

import '../models/product.dart';
import '../pages/detail_page.dart';

class ProductCardComponent extends StatelessWidget {
  final Product product;
  const ProductCardComponent({super.key, required this.product});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(product: product),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                product.thumbnail,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => const Icon(Icons.broken_image, size: 48, color: Colors.grey
                ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(product.title, style: const TextStyle(
                  fontWeight: FontWeight.bold
                )),
                SizedBox(height: 4),
                Text('Rp. ${product.price.toString()}', style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                )),
              ],),
            )
          ]
        )
      )
    );

  }
}