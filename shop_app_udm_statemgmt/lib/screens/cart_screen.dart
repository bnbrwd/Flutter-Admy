import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_udm_statemgmt/providers/orders.dart';
import 'package:shop_app_udm_statemgmt/providers/providers.dart' show Cart;
import 'package:shop_app_udm_statemgmt/widgets/widgets.dart' as ci;

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  // SizedBox(width: 10), // add space b\w row
                  const Spacer(),
                  Chip(
                    label: Text(
                      '₹${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color:
                            Theme.of(context).primaryTextTheme.headline6!.color,
                      ),
                    ), //Text('\₹${cart.totalAmount}'),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(primary: Colors.orange),
                      onPressed: cart.totalAmount <= 0
                          ? null
                          : () {
                              //here order is not changing only dispatch the action so used as false
                              Provider.of<Orders>(context, listen: false)
                                  .addOrder(
                                cart.items.values.toList(),
                                cart.totalAmount,
                              );
                              cart.clear();
                            },
                      child: const Text('ORDER NOW')),
                  // OrderButton(cart: cart)
                ],
              ),
            ),
          ),
          SizedBox(width: 10), //for inser space.
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length, // no of element in list.
                itemBuilder: (ctx, i) => ci.CartItem(
                      id: cart.items.values.toList()[i].id,
                      title: cart.items.values.toList()[i].title,
                      quantity: cart.items.values.toList()[i].quantity,
                      price: cart.items.values.toList()[i].price,
                      productId: cart.items.keys.toList()[i],
                    )),
          ),
        ],
      ),
    );
  }
}
/*
class OrderButton extends StatefulWidget {
  const OrderButton({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: _isLoading
            ? CircularProgressIndicator(color: Colors.green)
            : Text('ORDER NOW'),
        style: TextButton.styleFrom(primary: Colors.orange),
        onPressed: (widget.cart.totalAmount <= 0 || _isLoading)
            ? null
            : () async {
                setState(() {
                  _isLoading = true;
                });
                //here order is not changing only dispatch the action so used as false
                await Provider.of<Orders>(context, listen: false).addOrder(
                  widget.cart.items.values.toList(),
                  widget.cart.totalAmount,
                );
                setState(() {
                  _isLoading = false;
                });
                widget.cart.clear();
              });
  }
}
*/