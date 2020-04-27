import 'package:corona_tracker_app/screens/chart_view.dart';
import 'package:corona_tracker_app/screens/country_stats.dart';
import 'package:corona_tracker_app/services/data_service.dart';
import 'package:flutter/material.dart';
import 'package:corona_tracker_app/screens/world_stats.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Corona Tracker',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: Color(0xff1E272E),
            appBar: AppBar(
              title: Text(
                'Corona Tracker',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                ),
              ),
              backgroundColor: Color(0xff1b262c),
              bottom: TabBar(tabs: [
                Tab(
                  child: Text(
                    'World Stats',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Chart',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Country Stats',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                )
              ]),
            ),
            body: FutureProvider(
              create: (context) => DataService().getTotalStatsData(),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: TabBarView(children: [
                  WorldStats(),
                  ChartView(),
                  CountryStats(),
                ]),
              ),
            )),
      ),
    );
  }
}
