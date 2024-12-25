import 'package:calendar/features/clender_service_module/domain/entity/weather_entity.dart';

class WeatherModel extends WeatherEntity{
 const WeatherModel({required super.main, required super.temp, required super.temp_max, required super.temp_min, required super.description});

 factory WeatherModel.fromJson(Map<String, dynamic> json) {
   return WeatherModel(
     description: json["weather"][0]["description"],
     main: json["weather"][0]["main"],
     temp: json["main"]["temp"],
     temp_max: json["main"]["temp_max"],
     temp_min: json["main"]["temp_min"],
   );
 }
//
}