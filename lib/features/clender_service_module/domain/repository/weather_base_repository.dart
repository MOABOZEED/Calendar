 import 'package:calendar/core/error/failure.dart';
import 'package:calendar/features/clender_service_module/domain/entity/weather_entity.dart';
import 'package:dartz/dartz.dart';

abstract class WeatherBaseRepository{

  Future<Either<Failure,WeatherEntity>> getWeather();
}