import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mc_inventory_app/grid.dart';
import 'package:mc_inventory_app/item.dart';

class Inventory extends StatelessWidget {
  const Inventory({super.key});

  Future<List<Item>> fetchItems() async {
    try {
      // Fetch items from the server
      final response =
          await http.get(Uri.parse('https://localhost:5000/items'));
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        return (json.decode(response.body) as List)
            .map((data) => Item.fromJson(data))
            .toList();
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to load items');
      }
    } catch (_) {
      // If there's an error (e.g., no internet connection), generate 50 items
      return List<Item>.generate(
        50,
        (i) => Item(
          imageUrl: 'https://picsum.photos/seed/${i + 1}/128/128',
          name: 'ItemName',
          quantity: 'Quantity',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Item>>(
      future: fetchItems(),
      builder: (BuildContext context, AsyncSnapshot<List<Item>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // show loading spinner while waiting
        } else if (snapshot.hasError) {
          return Text(
              'Error: ${snapshot.error}'); // show error message if there's an error
        } else {
          return Grid(
              items: snapshot
                  .data!); // show grid if items are fetched successfully
        }
      },
    );
  }
}
