import 'package:flutter/material.dart';
import 'package:mc_inventory_app/inventory.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);
    const int tabsCount = 3;

    return DefaultTabController(
      initialIndex: 0,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Minecraft Smart Inventory App'),
          notificationPredicate: (ScrollNotification notification) {
            return notification.depth == 1;
          },
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.apps),
                text: 'Inventory',
              ),
              Tab(
                icon: Icon(Icons.build),
                text: 'Crafting',
              ),
              Tab(
                icon: Icon(Icons.notifications),
                text: 'Notifications',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Inventory(oddItemColor: oddItemColor, evenItemColor: evenItemColor),
            const Center(child: Text('Crafting')),
            const Center(child: Text('Notifications')),
          ],
        ),
      ),
    );
  }
}
