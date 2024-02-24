import 'package:flutter/material.dart';
import 'package:mc_inventory_app/inventory.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> tabs = [
      {
        'tab': Tab(
          icon: Icon(Icons.apps),
          text: 'Inventory',
        ),
        'view': Inventory(),
      },
      {
        'tab': Tab(
          icon: Icon(Icons.build),
          text: 'Crafting',
        ),
        'view': Center(
          child: Text('Crafting'),
        ),
      },
      {
        'tab': Tab(
          icon: Icon(Icons.notifications),
          text: 'Notifications',
        ),
        'view': Center(
          child: Text('Notifications'),
        ),
      },
    ];

    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Minecraft Smart Inventory App'),
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(
            tabs: tabs
                .map((Map<String, dynamic> tab) => tab['tab'] as Tab)
                .toList(),
          ),
        ),
        body: TabBarView(
          children: tabs
              .map((Map<String, dynamic> tab) => tab['view'] as Widget)
              .toList(),
        ),
      ),
    );
  }
}
