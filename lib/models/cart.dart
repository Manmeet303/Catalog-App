// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:velocity_x/velocity_x.dart';

import 'package:myfirstproject/core/store.dart';
import 'package:myfirstproject/models/catalog.dart';

class CartModel {
  //Catalog Field and created the model
  CatalogModel _catalog;

  //Collection of IDs - Store IDs of each Item
  final List<int> _itemIDs = [];

  //Get method to obtain the above private _catalog
  CatalogModel get catalog => _catalog;

  //Set method to set the catalog value
  set catalog(CatalogModel newcatalog) {
    assert(newcatalog != null);
    _catalog = newcatalog;
  }

// Get Items into the cart
  List<Item> get items => _itemIDs.map((id) => _catalog.getById(id)).toList();

  //Get the Total Prize of the cart using the folding method
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add Items
  void add(Item item) {
    _itemIDs.add(item.id);
  }

  // Remove Items from the cart
  void remove(Item item) {
    _itemIDs.remove(item.id);
  }
}

// Adding mutation and directly declaring the mystore at the starting so that we dont need to define them again and again
class AddMutation extends VxMutation<MyStore> {
  // taking an entire item field
  final Item item;

  AddMutation(
    this.item,
  );
  @override
  perform() {
    store.cart._itemIDs.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  // taking an entire item field
  final Item item;

  RemoveMutation(
    this.item,
  );
  @override
  perform() {
    store.cart._itemIDs.remove(item.id);
  }
}
