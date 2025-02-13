import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class Collection extends StatefulWidget {
  const Collection({super.key});

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  final List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];
  final List<String> otherItems = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"];

  // Create a ListEquality object to compare lists
  final ListEquality listEquality = const ListEquality();

  @override
  Widget build(BuildContext context) {
    bool areListsEqual = listEquality.equals(items, otherItems);  // Compare lists

    return Scaffold(
      appBar: AppBar(
        title: const Text('Collection Example'),
      ),
      body: Column(
        children: [
          if (areListsEqual)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Both lists are equal'),
            )
          else
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Lists are not equal'),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
