import 'package:flutter/material.dart';

import 'screens/featured_screen.dart';

class EducationalMainScreen extends StatefulWidget {
  @override
  State<EducationalMainScreen> createState() {
    return _EducationalMainScreenState();
  }
}

class _EducationalMainScreenState extends State<EducationalMainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static List<Widget> _widgetOptions = [
    const FeaturedScreen(),
    Container(
      child: const Center(
        child: Text('Learning'),
      ),
    ),
    Container(
      child: const Center(
        child: Text('WishList'),
      ),
    ),
    Container(
      child: const Center(
        child: Text('Settings'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.start,
              ),
              activeIcon: Icon(
                Icons.star_border,
                size: 45.0,
              ),
              label: 'Featured '),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle),
              activeIcon: Icon(
                Icons.play_circle_fill_outlined,
                size: 45.0,
              ),
              label: 'Learning '),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              activeIcon: Icon(
                Icons.favorite,
                size: 45.0,
              ),
              label: 'WishList '),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              activeIcon: Icon(
                Icons.settings_outlined,
                size: 45.0,
              ),
              label: 'Settings '),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF6849ef),
        iconSize: 26,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
