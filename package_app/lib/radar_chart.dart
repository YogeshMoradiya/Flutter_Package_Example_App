import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class RadarChartExample extends StatefulWidget {
  const RadarChartExample({super.key});

  @override
  State<RadarChartExample> createState() => _RadarChartExampleState();
}

class _RadarChartExampleState extends State<RadarChartExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Radar Chart Example'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RadarChart(
            RadarChartData(
              dataSets: [
                RadarDataSet(
                  fillColor: Colors.blueAccent.withOpacity(0.4),
                  borderColor: Colors.blueAccent,
                  entryRadius: 4,
                  dataEntries: [
                    const RadarEntry(value: 3),
                    const RadarEntry(value: 4),
                    const RadarEntry(value: 5),
                    const RadarEntry(value: 2),
                    const RadarEntry(value: 4),
                  ],
                ),
              ],
              radarBackgroundColor: Colors.transparent,
              borderData: FlBorderData(show: false),
              radarBorderData: const BorderSide(color: Colors.grey),
              titlePositionPercentageOffset: 0.2,
              titleTextStyle: const TextStyle(color: Colors.black, fontSize: 12),
              tickCount: 5,
              ticksTextStyle: const TextStyle(color: Colors.grey),
              tickBorderData: const BorderSide(color: Colors.grey, width: 2),
              gridBorderData: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}


