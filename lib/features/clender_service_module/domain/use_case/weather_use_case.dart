import 'package:calendar/core/error/failure.dart';
import 'package:calendar/core/usecase/base_usecase.dart';
import 'package:calendar/features/clender_service_module/domain/entity/weather_entity.dart';
import 'package:calendar/features/clender_service_module/domain/repository/weather_base_repository.dart';
import 'package:dartz/dartz.dart';

class WeatherUseCase extends BaseUseCase<WeatherEntity,NoParameters>{
final  WeatherBaseRepository weatherBaseRepository ;

WeatherUseCase( this.weatherBaseRepository);
@override
Future<Either<Failure,WeatherEntity>>call(NoParameters parameters)async {
  return await weatherBaseRepository.getWeather();

}
}