import 'package:flutter/material.dart';

class AnimateCon extends StatefulWidget {
  const AnimateCon({super.key});

  @override
  _AnimatedButtonScreenState createState() => _AnimatedButtonScreenState();
}

class _AnimatedButtonScreenState extends State<AnimateCon> {
  bool isTapMeSelected = true; // Track which button is selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Button Example'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isTapMeSelected = !isTapMeSelected; // Toggle between buttons
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: 300.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: isTapMeSelected ? Colors.blueAccent : Colors.greenAccent, // Change color based on selection
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // "Tap me" button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isTapMeSelected = true;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: isTapMeSelected ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      'Food',
                      style: TextStyle(
                        color: isTapMeSelected ? Colors.blueAccent : Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // "Water" button
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isTapMeSelected = false;
                    });
                  },
                  child: AnimatedContainer(width: 100,
                    height: 50,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                      color: !isTapMeSelected ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      'Water',
                      style: TextStyle(
                        color: !isTapMeSelected ? Colors.greenAccent : Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
