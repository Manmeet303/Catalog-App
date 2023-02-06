import 'package:flutter/material.dart';
import 'package:myfirstproject/Screen/homeDetailPage.dart';
import 'package:myfirstproject/widgets/Home_widgets/catalogItem.dart';
import 'package:myfirstproject/models/catalog.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];

        return InkWell(
            // here instead of pushname we will use only push which only needs route instead of routes name
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog))),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}
