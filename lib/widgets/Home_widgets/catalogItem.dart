// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:myfirstproject/widgets/Home_widgets/addtocart.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:myfirstproject/Screen/HomePage.dart';
import 'package:myfirstproject/models/cart.dart';
import 'package:myfirstproject/models/catalog.dart';
import 'package:myfirstproject/widgets/Home_widgets/catalogImage.dart';
import 'package:myfirstproject/widgets/theme.dart';

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key key,
    @required this.catalog,
  })  : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        // For Animation we added a Hero Widgets in which we had passed the tag which works as if we apply the same tag to 2 things then it will perform some animation
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.bold.lg.color(context.theme.hintColor).make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            // 10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              // buttonPadding: Vx.mH8,
              children: [
                "\$${catalog.price}".text.bold.lg.make(),
                AddToCart(catalog: catalog)
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).color(context.theme.cardColor).rounded.square(140).make().py12();
  }
}