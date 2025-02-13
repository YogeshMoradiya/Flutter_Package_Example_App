import 'package:flutter/material.dart';


class Button extends StatefulWidget {
  const Button({super.key});

  @override
  _SearchOptionsState createState() => _SearchOptionsState();
}

class _SearchOptionsState extends State<Button> {
  String selectedOption = 'searchChapters'; // Default selected option

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(), // Equivalent to max-w-2xl
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Search in',
            style: TextStyle(color: Colors.grey,fontSize: 10), // Equivalent to text-muted
          ),
          const SizedBox(height: 8), // Spacing between label and buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildRadioButton('MCQs'),
              _buildRadioButton('Topics'),
              _buildRadioButton('Chapters', isSelected: true), // Initially selected
              _buildRadioButton('Courses'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRadioButton(String option, {bool isSelected = false}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedOption = 'search$option'; // Update selected option
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: selectedOption == 'search$option' ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey, // Border color
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Center(
            child: Text(
              option,
              style: TextStyle(fontSize: 10,
                color: selectedOption == 'search$option' ? Colors.white : Colors.black,
                fontWeight: isSelected || selectedOption == 'search$option' ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
