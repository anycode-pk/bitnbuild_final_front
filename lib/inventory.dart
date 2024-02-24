import 'package:flutter/material.dart';
import 'package:mc_inventory_app/item.dart';

class Inventory extends StatelessWidget {
  final Color oddItemColor;
  final Color evenItemColor;

  const Inventory(
      {super.key, required this.oddItemColor, required this.evenItemColor});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(5),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 1,
      ),
      itemCount: 25,
      itemBuilder: (BuildContext context, int index) {
        return Item(
          imageUrl: 'https://picsum.photos/seed/$index/128/128',
          title: 'Item $index',
          subtitle: 'Quantity: $index',
        );
      },
    );
  }
}
