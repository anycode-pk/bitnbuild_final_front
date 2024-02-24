import 'package:flutter/material.dart';
import 'package:mc_inventory_app/tabs.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MC Inventory App',
      themeMode: ThemeMode.light,
      theme:
          ThemeData(colorScheme: const ColorScheme.light(), useMaterial3: true),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: const Tabs(),
    );
  }
}
