import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FontAwesome extends StatefulWidget {
  const FontAwesome({super.key});

  @override
  State<FontAwesome> createState() => _FontAwesomeState();
}

class _FontAwesomeState extends State<FontAwesome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('font_awesome'),
        backgroundColor: Colors.grey,
      ),
        body: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.play_circle_outline,
                size: 30,color: Colors.blueAccent,
              ),
              SizedBox(width: 11,),
              FaIcon(FontAwesomeIcons.amazon,color: Colors.blueAccent,size: 30,shadows: [BoxShadow(color: Colors.black)],)
            ],
          ),
        ),
    );
  }
}
