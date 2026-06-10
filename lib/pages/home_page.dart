import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/category_filter_component.dart';
import '../components/favorite_component.dart';
import '../components/product_card_component.dart';
import '../providers/product_provider.dart';

class HomePage extends StatefulWidget {
	const HomePage({super.key});

	@override
	State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
	@override
	void initState() {
		super.initState();
		Future.microtask(() {
			if (mounted) {
				context.read<ProductProvider>().fetchProducts('all');
			}
		});
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Text('Product Catalog'),
				backgroundColor: Theme.of(context).colorScheme.inversePrimary,
				actions: const [FavoriteComponent()],
			),
			body: Consumer<ProductProvider>(
				builder: (context, productProvider, _) {
					return Column(
						children: [
							const CategoryFilterComponent(),
							Expanded(child: buildContent(productProvider)),
						],
					);
				},
			),
		);
	}

	Widget buildContent(ProductProvider provider) {
		if (provider.isLoading) {
			return const Center(child: CircularProgressIndicator());
		}

		if (provider.errorMessage != null) {
			return Center(
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
						Text(provider.errorMessage!),
						const SizedBox(height: 12),
						ElevatedButton(
							onPressed: () => provider.fetchProducts(provider.selectedCategory),
							child: const Text('Coba lagi'),
						),
					],
				),
			);
		}

		return LayoutBuilder(
			builder: (context, constraints) {
				int columnCount = 2;
				if (constraints.maxWidth >= 900) {
					columnCount = 4;
				} else if (constraints.maxWidth > 600) {
					columnCount = 3;
				}

				return GridView.builder(
					padding: const EdgeInsets.all(12),
					gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
						crossAxisCount: columnCount,
						childAspectRatio: 0.75,
						crossAxisSpacing: 12,
						mainAxisSpacing: 12,
					),
					itemCount: provider.products.length,
					itemBuilder: (context, index) {
						final product = provider.products[index];
						return ProductCardComponent(product: product);
					},
				);
			},
		);
	}

}