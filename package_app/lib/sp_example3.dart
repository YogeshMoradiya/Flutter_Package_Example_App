import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpExample3 extends StatefulWidget {
  const SpExample3({super.key});

  @override
  _SharedPreferencesExampleState createState() => _SharedPreferencesExampleState();
}

class _SharedPreferencesExampleState extends State<SpExample3> {
  String _name = "No Name";
  int _age = 0;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Load saved data from SharedPreferences
  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? "No Name";
      _age = prefs.getInt('age') ?? 0;
    });
  }

  // Save data to SharedPreferences
  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _nameController.text);
    prefs.setInt('age', int.parse(_ageController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SharedPreferences Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Enter your name"),
            ),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(labelText: "Enter your age"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _name = _nameController.text;
                  _age = int.parse(_ageController.text);
                });
                _saveData();
              },
              child: const Text("Save Data"),
            ),
            const SizedBox(height: 20),
            Text("Name: $_name"),
            Text("Age: $_age"),
          ],
        ),
      ),
    );
  }
}
