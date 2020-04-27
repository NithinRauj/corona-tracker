import 'package:corona_tracker_app/services/data_service.dart';
import 'package:flutter/material.dart';

String countryNameField;
String countryName;
String flagURL;
int confirmed;
int dead;
int recovered;
bool showCountryStats = false;

class CountryStats extends StatefulWidget {
  @override
  _CountryStatsState createState() => _CountryStatsState();
}

class _CountryStatsState extends State<CountryStats> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.addListener(setCountryName);
  }

  void setCountryName() {
    countryNameField = controller.text;
  }

  void setCountryWiseStats(Map<String, dynamic> stats) {
    print('called');
    if (stats['confirmed'] != -1) {
      this.setState(() {
        countryName = stats['country'];
        confirmed = stats['confirmed'];
        dead = stats['dead'];
        recovered = stats['recovered'];
        flagURL = stats['flag'];
        showCountryStats = true;
      });
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Color(0xff272F35),
        content: Text(
          'Enter a valid Country',
          style: TextStyle(fontFamily: 'Montserrat', fontSize: 22.0),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 35.0),
              child: Container(
                width: 280.0,
                height: 60.0,
                child: TextField(
                  textAlign: TextAlign.center,
                  cursorColor: Colors.black,
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
                  textCapitalization: TextCapitalization.words,
                  controller: controller,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      focusColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff272F35)))),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () async {
                if (countryNameField != null && countryNameField != '') {
                  showCountryStats = false;
                  countryName = countryNameField.trim();
                  FocusScope.of(context).unfocus();
                  var response =
                      await DataService().getCountryStatsData(countryName);
                  setCountryWiseStats(response);
                }
              },
              color: Color(0xff272F35),
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: Text(
                'Get Stats',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 35.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            showCountryStats
                ? Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Container(
                      width: 310.0,
                      height: 230.0,
                      decoration: BoxDecoration(
                        color: Color(0xff272F35),
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              flagURL != null
                                  ? Image.network(
                                      flagURL,
                                      width: 45.0,
                                      height: 45.0,
                                    )
                                  : CircularProgressIndicator(),
                              SizedBox(width: 10.0),
                              Text(
                                countryNameField != null
                                    ? countryName
                                    : '<Country Name>',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 28.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Confirmed : ',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.blueAccent,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w300,
                                  )),
                              Text(
                                  confirmed != null
                                      ? confirmed.toString()
                                      : '000000',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 25.0)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Dead : ',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.redAccent,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w300,
                                  )),
                              Text(dead != null ? dead.toString() : '000000',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 25.0)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Recovered : ',
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.greenAccent,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w300,
                                  )),
                              Text(
                                  recovered != null
                                      ? recovered.toString()
                                      : '000000',
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 25.0)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    width: 310.0,
                    height: 230.0,
                  )
          ],
        ),
      ),
    );
  }
}
