import 'package:clima/services/location.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/screens/location_screen.dart';

class LoadingScreen extends StatefulWidget {
  final dynamic conditionFromPrev;
  final dynamic temperatureFromPrev;

  LoadingScreen({this.conditionFromPrev, this.temperatureFromPrev});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location _location = Location();
  WeatherModel _weatherModel = WeatherModel();
  Position position;
  dynamic condition;
  dynamic temperature;

  @override
  void initState() {
    super.initState();
    //call the user location method before build
    getLocationData();
  }

  void getLocationData() async {
    //get users current location
    var result = await _location.getLocation();
    setState(() {
      position = result;
    });

    //pass the location coordinates to get the current weather
    List<dynamic> weatherData =
    await _weatherModel.getLocationWeather(position);
    condition = weatherData[0];
    temperature = weatherData[1];

    //pass the weather details to the location screen using arguments in named routes
//    Navigator.pushNamed(context, "locationScreen",
//        arguments: {'condition': condition, "temp": temperature});
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        temperaturePass: temperature,
        conditionPass: condition,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    print("Building the app");
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Clima'),
      ),
      //The loading indicator will be displayed till all the details are being retrieved
      body: SpinKitDoubleBounce(
        color: Color(0xFF58ccc1),
        size: 120.0,
      ),
    );
  }
}
