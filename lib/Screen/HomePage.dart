// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:myfirstproject/models/catalog.dart';
import 'package:myfirstproject/widgets/drawer.dart';
import 'package:myfirstproject/widgets/itemwidget.dart';
import 'package:myfirstproject/widgets/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    // from here we need to cntinue...
    // List<Item> list =
    //     List.from(productsData).map<Item>((item) => Item.fromMap(item));
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
//TO generate the dummy list we can use list.generate
    // final dummyList = List.generate(4, (index) => CatalogModel.items[0]);
    // final imageURL = "";
    var days = 31;
    var name = "Catalog Project";

    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CatalogHeader(),
            if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              CatalogList().expand()
            else
              Center(child: CircularProgressIndicator()).expand()
          ]),
        ),
      ),
    );
  }
}

// Header Section

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "Catalog App".text.xl5.bold.color(MyTheme.darkBluisColor).make(),
      "Trending Products".text.xl2.make()
    ]);
  }
}

// List Section

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];

        return CatalogItem(catalog: catalog);
      },
    );
  }
}

//Catalog Item widgets
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
        CatalogImage(image: catalog.image),
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

// Images Section
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
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
