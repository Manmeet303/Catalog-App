import 'package:flutter/material.dart';
import 'package:myfirstproject/core/store.dart';
import 'package:myfirstproject/models/cart.dart';
import 'package:myfirstproject/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key key,
    @required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

// without VxState Management use below line
  // final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    // the below method is used to rebuild the entire tree after certain action
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    // Applying check in such a way that if the item already exits in the cart than it will be true else false
    // note : we use widget.catalog as a parameter instead of normal catalg parameter coz we were using statefullwodget so...
    bool isInCart = _cart.items.contains(catalog) ?? false;

    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            AddMutation(catalog);
          }
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.shadowColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: isInCart ? Icon(Icons.done) : Icon(Icons.add));
  }
}
