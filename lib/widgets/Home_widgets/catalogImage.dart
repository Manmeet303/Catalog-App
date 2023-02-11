import 'package:flutter/material.dart';
import 'package:myfirstproject/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key key, @required this.image})
      : assert(image != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .height(110)
        .rounded
        .p4
        .color(context.canvasColor)
        .make()
        .p16()
        .w40(context);
  }
}
