import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

// Data for the pie chart
Map<String, double> dataMap = {
  "Food Items": 18.47,
  "Clothes": 17.70,
  "Technology": 4.25,
  "Cosmetics": 3.51,
  "Other": 2.83,
};

// Colors for each segment
List<Color> colorList = [
  const Color(0xffD95AF3),
  const Color(0xff3EE094),
  const Color(0xff3398F6),
  const Color(0xffFA4A42),
  const Color(0xffFE9539)
];

// List of gradients for the chart
final gradientList = <List<Color>>[
  [
    const Color.fromRGBO(223, 250, 92, 1),
    const Color.fromRGBO(129, 250, 112, 1),
  ],
  [
    const Color.fromRGBO(129, 182, 205, 1),
    const Color.fromRGBO(91, 253, 199, 1),
  ],
  [
    const Color.fromRGBO(175, 63, 62, 1.0),
    const Color.fromRGBO(254, 154, 92, 1),
  ]
];

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({super.key});

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pie Chart'),
        backgroundColor: Colors.grey,
      ),
      body: Center(
        child: PieChart(
          dataMap: dataMap,
          colorList: colorList,
          chartRadius: MediaQuery.of(context).size.width / 2,
          centerText: "Budget",
          centerTextStyle: const TextStyle(color: Colors.black,fontSize: 15),
          ringStrokeWidth: 24,
          animationDuration: const Duration(seconds: 4),
          chartValuesOptions: const ChartValuesOptions(
              showChartValues: true,
              showChartValuesOutside: true,
              showChartValuesInPercentage: true,
              showChartValueBackground: false),
          legendOptions: const LegendOptions(
              showLegends: true,
              legendShape: BoxShape.rectangle,
              legendTextStyle: TextStyle(fontSize: 15),
              legendPosition: LegendPosition.bottom,
              showLegendsInRow: true),
          gradientList: gradientList,
        ),
      ),
    );
  }
}
