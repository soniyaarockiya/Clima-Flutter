import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  final dynamic temperaturePass;
  final dynamic conditionPass;

  LocationScreen({this.temperaturePass, this.conditionPass});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel _weatherModel = WeatherModel();
  double temp;

  var condition;
  String cityName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    temp = widget.temperaturePass - 273.15;
    condition = widget.conditionPass;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10.0),
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            color: Colors.blueGrey[800],
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.near_me,
                        size: 30.0,
                        color: Color(0xFFffc400),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        onChanged: (String value) {
                          cityName = value.trim().toString().toLowerCase();
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: FlatButton(
                            onPressed: () async {
                              if (cityName != null) {
                                dynamic weatherDataNew = await _weatherModel
                                    .getCityWeather(cityName);

                                setState(() {
                                  temp = weatherDataNew[1] - 273.15;
                                  condition = weatherDataNew[0];
                                  print(temp);
                                  print(condition);
                                });
                              }
                            },
                            child: Icon(
                              Icons.search,
                              color: Color(0xFFffc400),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
//                        color: Color(0xFF1de9b6),
                            ),
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                          ),
//                          labelText: 'Search',
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        temp.toInt().toString(),
                        style: kTempTextStyle,
                      ),
                      Text(
                        _weatherModel.getWeatherIcon(condition),
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
                Text(
                  _weatherModel.getMessage(temp.toInt()),
                  textAlign: TextAlign.center,
                  style: kMessageTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
