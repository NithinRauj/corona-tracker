import 'package:flutter/material.dart';

String countryNameField;
String countryName;
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

  void setCountryWiseStats(List<dynamic> stats) {
    print('called');
    for (var stat in stats) {
      if (stat['location'] == countryName) {
        confirmed = stat['confirmed'];
        dead = stat['dead'];
        recovered = stat['recovered'];
        showCountryStats = true;
        break;
      }
    }
    if (!showCountryStats) {
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
              onPressed: () {
                if (countryNameField != null && countryNameField != '') {
                  showCountryStats = false;
                  countryName = countryNameField.trim();
                  // if (provider.getResponse() != null) {
                  //   var data = provider.getResponse();
                  //   setCountryWiseStats(data);
                  FocusScope.of(context).unfocus();
                  // }
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
            !showCountryStats
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
                          Center(
                            child: Text(
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
                // : Scaffold.of(context).showSnackBar(SnackBar(
                //     content: Text('Enter a valid Country'),
                //   ))
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
