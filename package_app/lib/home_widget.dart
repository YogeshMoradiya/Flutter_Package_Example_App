import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';

//go route:https://github.com/HeyFlutter-Public/nested-routes-using-go-router/blob/main/lib/pages/settings_page.dart
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    // Load the initial counter value when the widget starts
    loadCounterValue();
  }

  Future<void> loadCounterValue() async {
    // Retrieve the counter value from HomeWidget
    int? counter = await HomeWidget.getWidgetData<int>('counter');
    setState(() {
      _counter = counter ?? 0;
    });
  }

  Future<void> updateHomeWidget() async {
    // Update the widget data
    await HomeWidget.saveWidgetData<int>('counter', _counter);
    await HomeWidget.updateWidget(name: 'AppWidgetProvider');
  }

  void incrementCounter() {
    setState(() {
      _counter++;
    });
    updateHomeWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Widget Example'),
          backgroundColor: Colors.grey,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Counter value: $_counter'),
              ElevatedButton(
                onPressed: incrementCounter,
                child: const Text('Increment Counter'),
              ),
            ],
          ),
        ),
      );

  }
}
