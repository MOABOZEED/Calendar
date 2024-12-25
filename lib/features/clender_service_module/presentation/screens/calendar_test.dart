import 'package:calendar/core/widget/enum.dart';
import 'package:calendar/features/clender_service_module/presentation/controller/calendar_bloc.dart';
import 'package:calendar/features/clender_service_module/presentation/controller/calendar_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarTest extends StatelessWidget {
  const CalendarTest({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CalendarBloc, CalenderState>(
      builder: (context, state) {
        if (state.requestEnum == RequestEnum.loading) {
          return CircularProgressIndicator();
        } else if (state.requestEnum == RequestEnum.error) {
          return Text("Temperature: ${state.weatherEntity?.temp.toStringAsFixed(2)} °C");
        } else if (state.requestEnum == RequestEnum.loaded) {
          return Text("Error: ${state.weatherEntity?.temp_min}");
        }
        return Text("Please wait...");
      },
    );
  }
}
