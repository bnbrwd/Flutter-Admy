import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_udm_statemgmt/providers/products.dart';
import 'package:shop_app_udm_statemgmt/widgets/widgets.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  const ProductsGrid({super.key, required this.showFavs});
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final products = showFavs ? productData.favoriteItems : productData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) {
          return ChangeNotifierProvider(
            create: (ctx) => products[index],
            child: ProductItem(
                // id: products[index].id,
                // title: products[index].title,
                // imageUrl: products[index].imageUrl,
                ),
          );
        });
  }
}
