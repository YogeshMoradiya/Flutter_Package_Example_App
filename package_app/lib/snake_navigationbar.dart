import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class SnakeNavigationbar extends StatefulWidget {
  const SnakeNavigationbar({super.key});

  @override
  State<SnakeNavigationbar> createState() => _SnakeNavigationbarState();
}

class _SnakeNavigationbarState extends State<SnakeNavigationbar> {
  // Define variables
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  SnakeShape snakeShape = SnakeShape.circle;
  ShapeBorder bottomBarShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
  );
  EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 30); // Adjusted padding
  Color selectedColor = Colors.black;
  bool showUnselectedLabels = true;
  bool showSelectedLabels = true;
  int _selectedItemPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SnakeNavigationBar.color(
        behaviour: snakeBarStyle,
        snakeShape: snakeShape,
        shape: bottomBarShape,
        padding: padding,

        // Configuration for SnakeNavigationBar.color
        snakeViewColor: selectedColor,
        backgroundColor: Colors.white,
        selectedItemColor:
        snakeShape == SnakeShape.indicator ? selectedColor : null,
        unselectedItemColor: Colors.grey,

        height: 60, // Increased height
        showUnselectedLabels: showUnselectedLabels,
        showSelectedLabels: showSelectedLabels,

        currentIndex: _selectedItemPosition,
        onTap: (index) => setState(() => _selectedItemPosition = index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Tickets'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_rounded), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.podcasts), label: 'Microphone'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ],
      ),
    );
  }
}
