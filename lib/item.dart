import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String quantity;

  const Item(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.quantity});

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
