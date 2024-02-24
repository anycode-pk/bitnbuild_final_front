import 'package:flutter/material.dart';
import 'package:mc_inventory_app/recipe.dart';

class Craftable extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String quantity;
  final Recipe recipe;

  const Craftable(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.quantity,
      required this.recipe});

  static Craftable fromJson(Map<String, dynamic> json) {
    return Craftable(
      imageUrl: json['imageUrl'],
      name: json['name'],
      quantity: json['quantity'],
      recipe: Recipe.fromJson(json['recipe']),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListTile(
            title: Text(name),
            subtitle: Text(quantity),
          ),
        ],
      ),
    );
  }
}
