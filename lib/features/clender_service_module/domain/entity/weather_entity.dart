import 'package:equatable/equatable.dart';

class WeatherEntity extends Equatable {
  final String main;
  final double temp;
  final double temp_max;
  final double temp_min;
  final String description;

  const WeatherEntity({ required this.description,required this.main, required this.temp, required this.temp_max, required this.temp_min});

  @override
  List<Object?> get props => [main, temp, temp_max, temp_min,description];
}