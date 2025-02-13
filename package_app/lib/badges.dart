import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BadgeDemo extends StatefulWidget {
  const BadgeDemo({super.key});

  @override
  State<BadgeDemo> createState() => _BadgeDemoState();
}

class _BadgeDemoState extends State<BadgeDemo> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badges'),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          badges.Badge(
            position: badges.BadgePosition.topEnd(top: 0, end: 3),
            animationDuration: const Duration(milliseconds: 300),
            animationType: badges.BadgeAnimationType.scale,
            badgeContent: Text(
              _counter.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            badgeColor: Colors.blueAccent,
            shape: badges.BadgeShape.circle,
            child: IconButton(
              icon: const Icon(Icons.shopping_cart,size: 50,),
              onPressed: () {
                print("These are items in your cart");
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _counter++;
                    });
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add Items'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_counter > 0) {
                      setState(() {
                        _counter--;
                      });
                    }
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text('Remove Items'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



