import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FlutterAnimate extends StatefulWidget {
  const FlutterAnimate({super.key});

  @override
  State<FlutterAnimate> createState() => _FlutterAnimateState();
}

class _FlutterAnimateState extends State<FlutterAnimate> {

  bool _isVisible = false;

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter_animate'),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: _toggleVisibility,
            child: const Text('Toggle Animation'),
          ),
          const SizedBox(height: 20),
          _isVisible
              ? Container(
                  width: 200,
                  height: 100,
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Hello!',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                )
                  .animate()
                  .fadeIn(duration: 300.ms)
                  .slideY() // Animate on appear
              : Container(),
        ],
      ),
    );
  }
}
