import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen6 extends StatefulWidget {
  const SplashScreen6({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen6> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();

    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Delay before navigating to home screen
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
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
            // Glowing Orb
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 6.3,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          Colors.blueAccent,
                          Colors.lightBlueAccent.withOpacity(0.1),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            // Animated Particles
            Positioned(
              top: 100,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(100 * _controller.value, 0),
                    child: const Icon(Icons.circle, size: 10, color: Colors.white54),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 100,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(-100 * _controller.value, 0),
                    child: const Icon(Icons.circle, size: 10, color: Colors.white54),
                  );
                },
              ),
            ),

            // App Logo with Fade-In Transition
            FadeTransition(
              opacity: _animation,
              child: ScaleTransition(
                scale: _animation,
                child: const Text(
                  'W E L C O M E',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
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
