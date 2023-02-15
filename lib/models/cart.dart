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