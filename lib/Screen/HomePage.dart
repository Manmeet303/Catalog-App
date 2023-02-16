// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfirstproject/core/store.dart';
import 'package:myfirstproject/models/cart.dart';
import 'package:myfirstproject/utils/Routes.dart';
import 'package:myfirstproject/widgets/Home_widgets/catalogHeader.dart';
import 'package:myfirstproject/widgets/Home_widgets/catalogList.dart';
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
    final _cart = (VxState.store as MyStore).cart;

//TO generate the dummy list we can use list.generate
    // final dummyList = List.generate(4, (index) => CatalogModel.items[0]);
    // final imageURL = "";
    var days = 31;
    var name = "Catalog Project";

    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        builder: (context, store, status) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.shadowColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            color: Vx.red500,
            size: 20,
            count: _cart.items.length,
            textStyle: TextStyle(fontWeight: FontWeight.bold)),
        mutations: {RemoveMutation, AddMutation},
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CatalogHeader(),
            if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              CatalogList().py16().expand()
            else
              Center(child: CircularProgressIndicator()).expand()
          ]),
        ),
      ),
    );
  }
}
