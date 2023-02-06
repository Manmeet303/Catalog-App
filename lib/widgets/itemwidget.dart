import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';
import 'package:myfirstproject/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key key, @required this.item}) : assert(item!=null), super(key: key);
  // const ItemWidget({Key key, @required this.item})
  //     : assert(item != null),
  //       super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: () {
            print("${item.name} pressed");
          },
          leading: Image.network(item.image),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text(
            "\$${item.price}",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.deepPurple),
            textScaleFactor: 1.3,
          ),
        ),
      ),
    );
  }
}
