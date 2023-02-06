import 'package:flutter/material.dart';
import 'package:myfirstproject/Screen/Home_widgets/catalogItem.dart';
import 'package:myfirstproject/models/catalog.dart';

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
