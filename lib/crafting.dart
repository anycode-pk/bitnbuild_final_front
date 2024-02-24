import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mc_inventory_app/grid.dart';
import 'package:mc_inventory_app/craftable.dart';
import 'package:mc_inventory_app/recipe.dart';

class Crafting extends StatelessWidget {
  const Crafting({super.key});

  Future<List<Craftable>> fetchItems() async {
    try {
      // Fetch items from the server
      final response =
          await http.get(Uri.parse('https://localhost:5000/crafting'));
      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, parse the JSON
        return (json.decode(response.body) as List)
            .map((data) => Craftable.fromJson(data))
            .toList();
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to load items');
      }
    } catch (_) {
      // If there's an error (e.g., no internet connection), generate 50 items
      return List<Craftable>.generate(
        50,
        (i) => Craftable(
          imageUrl: 'https://via.placeholder.com/150',
          name: 'Item $i',
          quantity: 'Quantity: $i',
          recipe: Recipe(
            ingredients: ['Ingredient 1', 'Ingredient 2'],
            name: 'Recipe $i',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Craftable>>(
      future: fetchItems(),
      builder: (BuildContext context, AsyncSnapshot<List<Craftable>> snapshot) {
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
