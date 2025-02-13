import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GoogleFont extends StatefulWidget {
  const GoogleFont({super.key});

  @override
  State<GoogleFont> createState() => _GoogleFontState();
}

class _GoogleFontState extends State<GoogleFont> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Font'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Text('Hello ! User',
        style: GoogleFonts.rubikBeastly(color: Colors.blueAccent,fontSize: 30),
      ),

      ),
    );
  }
}
