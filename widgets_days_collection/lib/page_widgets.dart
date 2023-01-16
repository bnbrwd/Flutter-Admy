import 'package:flutter/material.dart';

class PageWidgets extends StatefulWidget {
  const PageWidgets({Key? key}) : super(key: key);

  @override
  State<PageWidgets> createState() => _PageWidgetsState();
}

class _PageWidgetsState extends State<PageWidgets> {
  var _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('page widget')),
      body: NavigationRail(
        destinations: const [
          NavigationRailDestination(
            icon: Icon(Icons.house_outlined),
            selectedIcon: Icon(Icons.house),
            label: Text('Home'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.star_border),
            selectedIcon: Icon(Icons.star),
            label: Text('Favorites'),
          ),
          NavigationRailDestination(
            icon: Icon(Icons.account_circle_outlined),
            selectedIcon: Icon(Icons.account_circle),
            label: Text('Profile'),
          ),
        ],
        selectedIndex: _selectedIndex,
        useIndicator: true,
        elevation: 10,
        onDestinationSelected: changeDestination,
        backgroundColor: Colors.black12,
        indicatorColor: Colors.green,
        leading: Icon(Icons.menu),
        trailing: Icon(Icons.edit_note),
        selectedLabelTextStyle: TextStyle(color: Colors.white),
        unselectedLabelTextStyle: TextStyle(color: Colors.grey),
      ),
    );
  }

  void changeDestination(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
