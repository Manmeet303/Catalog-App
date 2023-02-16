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
    final CartModel _cart = (VxState.store as MyStore).cart;
    // Applying check in such a way that if the item already exits in the cart than it will be true else false
    // note : we use widget.catalog as a parameter instead of normal catalg parameter coz we were using statefullwodget so...
    bool isInCart = _cart.items.contains(catalog) ?? false;

    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            isInCart = isInCart.toggle();
            final _catalog = CatalogModel();
            // Coz we had defined the set and get method so we need to add this
            _cart.add(catalog);
            _cart.catalog = _catalog;
            // Adding the setState coz we are showing that after any performance the UI is rebuild
            // setState(() {});
          }
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.shadowColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: isInCart ? Icon(Icons.done) : Icon(Icons.add));
  }
}
