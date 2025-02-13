  import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTextScreen extends StatefulWidget {
  const AnimatedTextScreen({super.key});

  @override
  State<AnimatedTextScreen> createState() => _AnimatedTextScreenState();
}

class _AnimatedTextScreenState extends State<AnimatedTextScreen> {
   List<MaterialColor> colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

   TextStyle colorizeTextStyle = const TextStyle(
    fontSize: 50.0,
    fontFamily: 'Horizon',
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedTextKit'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: SizedBox(
          height: 60,
          child: DefaultTextStyle(
            style: const TextStyle(
              color: Colors.teal,
              fontSize: 40,
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              isRepeatingAnimation: true,
              animatedTexts: <AnimatedText>[
                WavyAnimatedText('Hello World!'),
                RotateAnimatedText('AWESOME'),
                FadeAnimatedText('do it RIGHT NOW!!!'),
                TyperAnimatedText('and then do your best'),
                TypewriterAnimatedText('Discipline is the best tool'),
                ScaleAnimatedText('Think'),
                FlickerAnimatedText('Flicker Frenzy'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
