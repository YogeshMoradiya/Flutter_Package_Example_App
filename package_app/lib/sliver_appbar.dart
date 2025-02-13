import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Collapsing Toolbar Example',
      home: CustomSliverAppBarExample(),
    );
  }
}

class CustomSliverAppBarExample extends StatelessWidget {
  const CustomSliverAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0, // Set the height for the expanded state
            floating: false,
            pinned: true, // Keep the app bar pinned
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Collapsing Toolbar'),
              background: Image.network(
                'https://source.unsplash.com/featured/?nature',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ListTile(
                  title: Text('List Item ${index + 1}'),
                );
              },
              childCount: 50, // Number of items in the list
            ),
          ),
        ],
      ),
    );
  }
}
