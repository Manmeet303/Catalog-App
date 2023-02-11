import 'package:flutter/material.dart';
import 'package:myfirstproject/models/catalog.dart';
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
                  color: MyTheme.darkBluisColor, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent),
      backgroundColor: MyTheme.creamColor,
      // Copied the BottomBar from the catalogItem
      bottomNavigationBar: Container(
        // to disappear the Background color of the footer to white
        color: Colors.white,
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
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluisColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Add to cart".text.lg.make())
                .wh(110, 50)
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
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.bold.xl3
                        .color(MyTheme.darkBluisColor)
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
