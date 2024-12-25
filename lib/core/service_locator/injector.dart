import 'package:calendar/features/clender_service_module/data/repository/weather_repository_implementation.dart';
import 'package:calendar/features/clender_service_module/domain/repository/weather_base_repository.dart';
import 'package:get_it/get_it.dart';

import '../../features/clender_service_module/domain/use_case/weather_use_case.dart';
import '../../features/clender_service_module/presentation/controller/calendar_bloc.dart';


 final  sl = GetIt.instance;

  void init() async {
    //bloc
    sl.registerFactory(() => CalendarBloc(sl()));
    //useCase
    sl.registerLazySingleton(() => WeatherUseCase(sl()));

    sl.registerLazySingleton<WeatherBaseRepository>(
          () => WeatherRepoImplementation(),
    );
    //repository
  }

