import 'package:flutter/material.dart';
import 'package:myfirstproject/models/catalog.dart';
import 'package:myfirstproject/widgets/Home_widgets/addtocart.dart';
import 'package:myfirstproject/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(catalog.name,
              style: TextStyle(
                  color: context.theme.hintColor, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent),
      backgroundColor: context.theme.canvasColor,
      // Copied the BottomBar from the catalogItem
      bottomNavigationBar: Container(
        // to disappear the Background color of the footer to white
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          // buttonPadding: Vx.mH8,
          children: [
            "\$${catalog.price}"
                .text
                .bold
                .color(MyTheme.darkBluisColor)
                .xl3
                .red700
                .make(),
            // Replaced the elevated button with used AddToCart widget button file of homepage over here so that at both the places it shows the same button
            AddToCart(catalog: catalog)
                // ElevatedButton(
                //         onPressed: () {},
                //         style: ButtonStyle(
                //             backgroundColor: MaterialStateProperty.all(
                //                 context.theme.shadowColor),
                //             shape: MaterialStateProperty.all(StadiumBorder())),
                //         child: "Add to cart".text.lg.make())
                .wh(120, 50)
          ],
        ).p24(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(catalog.image).h32(context),
          ),
          Expanded(
              child: VxArc(
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            height: 30.0,
            child: Container(
                color: context.theme.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.bold.xl3
                        .color(context.theme.hintColor)
                        .make(),
                    catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                  ],
                ).py64()),
          ))
        ]),
      ),
    );
  }
}
