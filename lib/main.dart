import 'package:corona_tracker_app/screens/chart_view.dart';
import 'package:corona_tracker_app/screens/country_stats.dart';
import 'package:flutter/material.dart';
import 'package:corona_tracker_app/screens/world_stats.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: Color(0xff1E272E),
            appBar: AppBar(
              title: Text('Corona Tracker'),
              backgroundColor: Color(0xff1b262c),
              bottom: TabBar(tabs: [
                Tab(
                  child: Text('World Stats'),
                ),
                Tab(
                  child: Text('Chart View'),
                ),
                Tab(
                  child: Text('Country Stats'),
                )
              ]),
            ),
            body: TabBarView(children: [
              WorldStats(),
              ChartView(),
              CountryStats(),
            ])),
      ),
    );
  }
}
