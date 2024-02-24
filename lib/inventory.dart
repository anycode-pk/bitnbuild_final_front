import 'package:flutter/material.dart';
import 'package:mc_inventory_app/grid.dart';
import 'package:mc_inventory_app/item.dart';

class Inventory extends StatelessWidget {
  const Inventory({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Item> items = [];
    for (int i = 1; i <= 50; i++) {
      items.add(
        Item(
          imageUrl: 'https://picsum.photos/seed/$i/128/128',
          name: 'ItemName',
          quantity: 'Quantity',
        ),
      );
    }
    return Grid(items: items);
  }
}
