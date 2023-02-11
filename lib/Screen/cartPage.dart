import 'package:flutter/material.dart';
import 'package:myfirstproject/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
          title: Text("Cart Page",
              style: TextStyle(
                  color: MyTheme.darkBluisColor, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent),
    );
  }
}
