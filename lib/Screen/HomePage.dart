import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myfirstproject/models/catalog.dart';
import 'package:myfirstproject/widgets/drawer.dart';
import 'package:myfirstproject/widgets/itemwidget.dart';
import 'dart:convert';

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
        appBar: AppBar(
          title: Text(
            "Catalog APP",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              ? ListView.builder(
                  itemCount: CatalogModel.items.length,
                  itemBuilder: (context, index) {
                    return ItemWidget(
                      item: CatalogModel.items[index],
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
        drawer: MyDrawer());
  }
}
