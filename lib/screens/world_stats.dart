import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorldStats extends StatefulWidget {
  @override
  _WorldStatsState createState() => _WorldStatsState();
}

class _WorldStatsState extends State<WorldStats> {
  @override
  Widget build(BuildContext context) {
    Map<String, int> totalStats = Provider.of<Map<String, int>>(context);
    return Container(
        child: totalStats == null
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  StatsWidget(
                    title: 'CONFIRMED',
                    stats: totalStats != null ? totalStats['confirmed'] : 0,
                    statsColor: Colors.blue[300],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  StatsWidget(
                    title: 'DEAD',
                    stats: totalStats != null ? totalStats['dead'] : 0,
                    statsColor: Colors.redAccent,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  StatsWidget(
                    title: 'RECOVERED',
                    stats: totalStats != null ? totalStats['recovered'] : 0,
                    statsColor: Colors.greenAccent,
                  ),
                ],
              ));
  }
}

class StatsWidget extends StatelessWidget {
  const StatsWidget({this.title, this.stats, this.statsColor});

  final String title;
  final int stats;
  final Color statsColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230.0,
      height: 150.0,
      child: Card(
        color: Color(0xff272F35),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontSize: 25.0,
              ),
            ),
            Text(
              stats.toString(),
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: statsColor,
                fontSize: 35.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
