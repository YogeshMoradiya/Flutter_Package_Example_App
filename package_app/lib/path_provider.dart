import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class PathProvider extends StatefulWidget {
  const PathProvider({super.key});

  @override
  State<PathProvider> createState() => _PathProviderState();
}

class _PathProviderState extends State<PathProvider> {
  String _fileContent = "File not created yet";
  String _filePath = "Path not available";

  Future<String> _getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/my_file.txt';
  }

  Future<File> _createFile() async {
    final path = await _getFilePath();
    setState(() {
      _filePath = path;  // Store the file path in the state
    });
    return File(path).writeAsString('Hello from Path Provider!');
  }

  Future<void> _readFile() async {
    try {
      final path = await _getFilePath();
      String content = await File(path).readAsString();
      setState(() {
        _fileContent = content;
      });
    } catch (e) {
      setState(() {
        _fileContent = 'Error reading file!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Path Provider'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await _createFile();
                await _readFile();
              },
              child: const Text('Create and Read File'),
            ),
            const SizedBox(height: 20),
            Text('File Content: $_fileContent'),
            const SizedBox(height: 20),
            Text('File Path: $_filePath'),  // Display the file path
          ],
        ),
      ),
    );
  }
}
