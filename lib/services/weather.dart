import 'package:clima/services/networking.dart';

//This will deal with anything and everything related to weather,
// the network class gives the input to this class.

const apiKey = "b4a34514f7c95cb3ff065c26125d27c6";

class WeatherModel {
  Networking _networking = Networking();

  Future<List<dynamic>> getLocationWeather(dynamic position) async {
    String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=${position
        .latitude}&lon=${position.longitude}&appid=$apiKey";

    dynamic response = await _networking.getData(url);

    dynamic condition = response['weather'][0]['id'];
    dynamic temperature = response['main']['temp'];
    List<dynamic> weatherData = List();
    weatherData.add(condition);
    weatherData.add(temperature);
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
