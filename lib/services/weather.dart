import 'package:clim/services/location.dart';
import 'package:clim/services/networking.dart';


const String APIkey = 'ec44f4291af78cfb83507a132c0ea486';
const openWeatherMapURL = 'http://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{
    var url = '$openWeatherMapURL?q=$cityName&appid=$APIkey&units=metric';
    NetworkSup networkSup =  NetworkSup(url);

    var weatherData = await networkSup.getData();
    return weatherData;
  }

  Future<dynamic>getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();
    NetworkSup networkSup = NetworkSup('$openWeatherMapURL?lat=${location.latitude}&lon=${location.longtitude}&appid=$APIkey&units=metric');
    var weatherData = await networkSup.getData();

    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
