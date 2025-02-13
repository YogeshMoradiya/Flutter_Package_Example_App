import 'package:flutter/material.dart';
import 'package:package_app/path_provider.dart';
import 'package:package_app/pie_chart.dart';
import 'package:package_app/pie_chart2.dart';
import 'package:package_app/radar_chart.dart';
import 'package:package_app/scatter_chart.dart';
import 'package:package_app/sensors_plus.dart';
import 'package:package_app/shared_preferences_ex1.dart';
import 'package:package_app/sliver_appbar.dart';
import 'package:package_app/snake_navigationbar.dart';
import 'package:package_app/sp_example3.dart';
import 'package:package_app/splash_screen1.dart';
import 'package:package_app/splash_screen2.dart';
import 'package:package_app/splash_screen3.dart';
import 'package:package_app/splash_screen4.dart';
import 'package:package_app/splash_screen5.dart';
import 'package:package_app/splash_screen6.dart';
import 'package:package_app/splash_screen7.dart';
import 'package:package_app/sqflite.dart';
import 'package:package_app/url_luncher.dart';
import 'animate_con.dart';
import 'animate_effects.dart';
import 'animated_text_kit.dart';
import 'animations.dart';
import 'badges.dart';
import 'bar_chart.dart';
import 'bar_chart1.dart';
import 'bottom_nav.dart';
import 'button.dart';
import 'cached_network_image.dart';
import 'collection.dart';
import 'connectivity.dart';
import 'contactlist_sp.dart';
import 'device_info.dart';
import 'feedback.dart';
import 'flutter_animate.dart';
import 'flutter_rating_bar.dart';
import 'flutter_slidable.dart';
import 'font_awesome.dart';
import 'gap.dart';
import 'google_font.dart';
import 'gyroscope_sensor_example.dart';
import 'line_chart.dart';
import 'location.dart';
import 'login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // Define a TextEditingController for the search bar.
  TextEditingController searchController = TextEditingController();

  Map<String, Widget> widgetMap = {
    'Url Luncher': const UrlLuncherWidget(),
    'Location': const Location(),
    'DeviceInfo': const DeviceInfo(),
    'Connectivity Screen': const ConnectivityScreen(),
    'AnimatedTextKit': const AnimatedTextScreen(),
    'FlutterSlidable': const FlutterSlidableWidget(),
    'Animations': const Animations(),
    'Accelerometer Sensor Example': const SensorsPlus(),
    'Gyroscope Sensor Example': const GyroscopeSensorExample(),
    'Collection': const Collection(),
    'FontAwesome': const FontAwesome(),
    'Cached Network Image': const CachedNetworkImageExample(),
    'PathProvider': const PathProvider(),
    'Badge Example': const BadgeDemo(),
    'GoogleFont': const GoogleFont(),
    'FlutterRatingBar': const FlutterRatingBar(),
    // 'flame': const Flame(),
    'FlutterAnimate': const FlutterAnimate(),
    'FlutterAnimate2': const AnimateEffects(),
    'Pie Chart': const PieChartWidget(),
    'Pie Chart 2': const PieChartSample2(),
    'Bar Chart': const BarChartSample2(),
    'Bar Chart 2':  BarChartExample1(),
    'Line Chart': const LineChartSample2(),
    'Scatter Chart': const ScatterChartSample2(),
    'Radar Chart': const RadarChartExample(),
    'Gap': const GapExample(),
     'feedback':CustomFeedbackForm(onSubmit: (String feedbackText, {Map<String, dynamic>? extras}) {
        // Handle feedback submission logic here
        print('Feedback Text: $feedbackText');
        print('Additional Feedback Data: $extras');
      },
    ),
    'SqlLite': const SqlLite(),
    'Shared Preferences': const SharedPreferencesEx1(),
    'Shared Preferences1': const SpExample3(),
    'Contactlist sharedpref': const ContactlistSp(),
    'login': const MyLogin(),
    'BottomNav': const BottomNav(),
    'AnimateCon': const AnimateCon(),
    'Button': const Button(),
    'CustomSliverAppBarExample': const CustomSliverAppBarExample(),
    'SplashScreen 1': const SplashScreen1(),
    'SplashScreen 2': const SplashScreen2(),
    'SplashScreen 3': const SplashScreen3(),
    'SplashScreen 4': const SplashScreen4(),
    'SplashScreen 5': const SplashScreen5(),
    'SplashScreen 6': const SplashScreen6(),
    'SplashScreen 7': const SplashScreen7(),
    'Snake Navigationbar': const SnakeNavigationbar(),


    // 'MyApp': const MyApp(),
  };

  //search code
  // List to store the filtered widget names
  List<String> filteredWidgetNames = [];

  @override
  void initState() {
    super.initState();
    // Initialize the filteredWidgetNames with all the widget names
    filteredWidgetNames = widgetMap.keys.toList();
  }

  // Method to filter the widget list based on search input
  void filterSearchResults(String query) {
    setState(() {
      // If the query is empty, show all widgets
      if (query.isEmpty) {
        filteredWidgetNames = widgetMap.keys.toList();
      } else {
        // Convert first letter to uppercase for consistency
        query = query[0].toUpperCase() + query.substring(1);
        filteredWidgetNames = widgetMap.keys.where((widgetName) => widgetName.contains(query)).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: const Text(
          'All Files',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body:  Column(
        children: [
          // ***Search bar to filter the widgets
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: filterSearchResults,
              decoration: const InputDecoration(
                labelText: 'Search Package',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: GridView.count(
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                crossAxisCount: 3,
                children: filteredWidgetNames.map(
                      (widgetName) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return widgetMap[widgetName]!;
                            },
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 100,
                        width: 100,
                        alignment: Alignment.center,
                        child: Text(
                          widgetName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}