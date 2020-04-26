import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

Map<String, double> map = new Map();
List<Color> colorList = [
  Colors.blue[300],
  Colors.redAccent,
  Colors.greenAccent
];

Map<String, double> sampleMap = {
  'Confirmed': 1000.0,
  'Dead': 2500.0,
  'Recovered': 3400
};

class ChartView extends StatefulWidget {
  @override
  _ChartViewState createState() => _ChartViewState();
}

class _ChartViewState extends State<ChartView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 65.0),
              child: PieChart(
                dataMap: sampleMap,
                animationDuration: Duration(
                  milliseconds: 1000,
                ),
                legendPosition: LegendPosition.bottom,
                chartRadius: 300.0,
                chartLegendSpacing: 60,
                chartValueStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                  color: Colors.black,
                ),
                legendStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w300,
                  fontSize: 20.0,
                  color: Colors.white,
                ),
                colorList: colorList,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
