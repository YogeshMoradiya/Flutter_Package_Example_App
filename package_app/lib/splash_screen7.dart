import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen7 extends StatefulWidget {
  const SplashScreen7({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen7> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _logoController;
  late Animation<double> _logoScaleAnimation;

  @override
  void initState() {
    super.initState();

    // Animation controller for the rotating cubes
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();

    // Animation controller for the logo reveal
    _logoController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _logoScaleAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoController,
        curve: Curves.bounceOut,
      ),
    );

    // Start the logo animation after the cube animation
    Future.delayed(const Duration(seconds: 4), () {
      _logoController.forward();
    });

    // Navigate to the next screen after the splash
    Timer(const Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _logoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // Cube 1
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.identity()
                    ..rotateY(_controller.value * 3.14) // Rotate on Y-axis
                    ..rotateX(_controller.value * 3.14 / 2), // Rotate on X-axis
                  alignment: FractionalOffset.center,
                  child: _buildCube(Colors.blueAccent),
                );
              },
            ),

            // Cube 2
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.identity()
                    ..rotateY(-_controller.value * 3.14) // Rotate in opposite direction
                    ..rotateX(_controller.value * 3.14 / 3),
                  alignment: FractionalOffset.center,
                  child: _buildCube(Colors.redAccent),
                );
              },
            ),

            // Cube 3
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform(
                  transform: Matrix4.identity()
                    ..rotateY(_controller.value * 3.14 / 2)
                    ..rotateX(-_controller.value * 3.14 / 3),
                  alignment: FractionalOffset.center,
                  child: _buildCube(Colors.greenAccent),
                );
              },
            ),

            // Logo Reveal with Scale
            FadeTransition(
              opacity: _logoScaleAnimation,
              child: ScaleTransition(
                scale: _logoScaleAnimation,
                // child: const Text('MyApp', style: TextStyle(fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold,),
                ),
              ),
          ],
        ),
      ),
    );
  }

  // Method to build a cube (as a square container for simplicity)
  Widget _buildCube(Color color) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            spreadRadius: 3,
            blurRadius: 8,
            offset: const Offset(0, 5),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home Page',
          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),
        ),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      body: const Center(child: Text('welcome Home Screen')),
    );
  }
}
