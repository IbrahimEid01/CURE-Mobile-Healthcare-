import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppShell({super.key, required this.navigationShell});

  void onItemTapped(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "CURE",
          style: TextStyle(
            color: Color(0xff0B4A8B),
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),

        leading: Container(
          margin: const EdgeInsets.only(left: 15),
          child: CircleAvatar(
            backgroundColor: Colors.grey[100],
            radius: 15,
            child: Icon(Icons.person, color: Color(0xff0B4A8B), size: 40),
          ),
        ),

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Row(
              children: const [
                Text("الفيوم، مصر", style: TextStyle(color: Colors.black87)),
                SizedBox(width: 5),
                Icon(Icons.location_on_outlined, color: Color(0xff0B4A8B)),
              ],
            ),
          ),
        ],
      ),

      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(index),

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.medical_services),
            selectedIcon: Icon(Icons.medical_services),
            label: 'Services',
          ),
          NavigationDestination(
            icon: Icon(Icons.help),
            selectedIcon: Icon(Icons.help),
            label: 'How To Work',
          ),
          NavigationDestination(
            icon: Icon(Icons.info),
            selectedIcon: Icon(Icons.info),
            label: 'Why Cure',
          ),

          NavigationDestination(
            icon: Icon(Icons.account_circle),
            selectedIcon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
