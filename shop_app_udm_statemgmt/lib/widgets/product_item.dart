import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_udm_statemgmt/providers/providers.dart';
import 'package:shop_app_udm_statemgmt/screens/screens.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // const ProductItem(
  //     {Key? key, required this.id, required this.title, required this.imageUrl})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      //clip round rectangle
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              // left side will appear
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                // Icons.favorite,
              ),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          // here Consumer will rebuild to specific.
          // leading: Consumer<Product>(
          //   builder: (ctx, product, child) => IconButton(
          //     // left side will appear
          //     icon: Icon(
          //       product.isFavorite ? Icons.favorite : Icons.favorite_border,
          //       // Icons.favorite,
          //     ),
          //     onPressed: () {
          //       product.toggleFavoriteStatus(authData.token, authData.userId);
          //     },
          //     color: Theme.of(context).colorScheme.secondary,
          //   ),
          // ),

          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            // Right side will appear
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
              // Scaffold.of(context).hideCurrentSnackBar();
              // Scaffold.of(context).showSnackBar(
              //   SnackBar(
              //     content: const Text(
              //       'Added item to cart!',
              //       textAlign: TextAlign.left,
              //     ),
              //     duration: Duration(seconds: 2),
              //     action: SnackBarAction(
              //       label: 'UNDO',
              //       onPressed: () {
              //         cart.removeSingleItem(product.id);
              //       },
              //     ),
              //   ),
              // );
            },
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover, // set in equal dimension
          ),
        ),
      ),
    );
  }
}
