import 'package:calendar/core/error/failure.dart';
import 'package:calendar/core/utils/api_constant.dart';
import 'package:calendar/features/clender_service_module/data/model/weather_model.dart';
import 'package:calendar/features/clender_service_module/domain/entity/weather_entity.dart';
import 'package:calendar/features/clender_service_module/domain/repository/weather_base_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class WeatherRepoImplementation extends WeatherBaseRepository {
  @override
  Future<Either<Failure, WeatherEntity>> getWeather() async {
    try {
      final dio = Dio();

      final response = await dio.get(
        ApiConstant.weatherUrl
          );
      if (response.statusCode == 200) {
        print("response.dataa${response.data}");
        final data = WeatherModel.fromJson(response.data);
        print("response.dataa$data");
        return Right(data);
      } else {
        return const Left(ServerFailure());
      }
    } catch (e) {
      return const Left(ServerFailure());

    }
  }
}


//
// import 'package:calendar/core/error/failure.dart';
// import 'package:calendar/features/clender_service_module/domain/entity/weather_entity.dart';
// import 'package:calendar/features/clender_service_module/domain/repository/weather_base_repository.dart';
// import 'package:dartz/dartz.dart';
//
// import '../data_source/weather_data_source.dart';
//
// ////////////////////
// class WeatherImpl extends WeatherBaseRepository{
//   final BaseWeatherDataSource baseWeatherDataSource;
//
//
//   WeatherImpl(
//       this.baseWeatherDataSource);
//   @override
//   Future<Either<Failure, WeatherEntity>> call()async {
//   final result=  await baseWeatherDataSource.getWeather();
// try {
//
//   return Right(result);
// }catch(e){
//  return const Left(ServerFailure());
// }
//   }
//
// }
