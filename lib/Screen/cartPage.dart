import 'package:flutter/material.dart';
import 'package:myfirstproject/core/store.dart';
import 'package:myfirstproject/models/cart.dart';
import 'package:myfirstproject/models/catalog.dart';
import 'package:myfirstproject/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
          title: Text("Cart Page",
              style: TextStyle(
                  color: context.theme.hintColor, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent),
      body: Column(
        children: [
          // Using Placeholder can help us to have a rough design of the particular section
          // Placeholder().p32().expand(),
          _CartList().p32().expand(),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}"
              .text
              .xl4
              .color(context.theme.hintColor)
              .make(),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              // Using this scaffoldmessenger we can display the snackbar at the bottom of the page
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying not Supported yet..".text.make()));
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(context.theme.shadowColor),
            ),
            child: "Buy".text.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  // creating the object of a cartmodel so that we can access all things of that mmodel directly

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    // Now if there are no items in the cart or is empty than display the msg of nothing to show else display the items
    return _cart.items.isEmpty
        ? "Nothing to show"
            .text
            .color(context.theme.hintColor)
            .xl2
            .makeCentered()
        : ListView.builder(
            // It means if the items are not null than display the items added as per the length
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle),
                onPressed: () {
                  _cart.remove(_cart.items[index]);
                  // Adding the setState coz we are showing that after any performance the UI is rebuild
//commented below setstate coz now the above widget is no more statefull so...
                  // setState(() {});
                },
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
