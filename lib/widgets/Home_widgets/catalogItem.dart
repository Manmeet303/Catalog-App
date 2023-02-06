import 'package:flutter/material.dart';
import 'package:myfirstproject/Screen/HomePage.dart';
import 'package:myfirstproject/widgets/Home_widgets/catalogImage.dart';
import 'package:myfirstproject/models/catalog.dart';
import 'package:myfirstproject/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

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
            catalog.name.text.bold.lg.color(MyTheme.darkBluisColor).make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            // 10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              // buttonPadding: Vx.mH8,
              children: [
                "\$${catalog.price}"
                    .text
                    .bold
                    .color(MyTheme.darkBluisColor)
                    .lg
                    .make(),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluisColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Buy".text.make())
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).white.rounded.square(140).make().py12();
  }
}
