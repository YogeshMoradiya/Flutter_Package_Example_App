import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
//https://github.com/gskinner/flutter_animate?tab=readme-ov-file
class AnimateEffects extends StatefulWidget {
  const AnimateEffects({super.key});

  @override
  _AnimatedListViewState createState() => _AnimatedListViewState();
}

class _AnimatedListViewState extends State<AnimateEffects> {
  List<String> items = List.generate(20, (index) => 'Item $index');
  String sliderText = 'Click Me!';
  double sliderFontSize = 24;

  void _changeSliderText() {
    setState(() {
      // Change the text size and content
      sliderFontSize = sliderFontSize == 24 ? 32 : 24; // Toggle size
      sliderText = sliderText == 'Click Me!' ? 'Clicked!' : 'Click Me!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Animated List View')),
      body: Column(
        children: [
          GestureDetector(
            onTap: _changeSliderText,
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: Text(
                sliderText,
                style: TextStyle(
                  fontSize: sliderFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ).animate().scale(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      items[index],
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ).animate().fadeIn().moveY(duration: 200.ms),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
