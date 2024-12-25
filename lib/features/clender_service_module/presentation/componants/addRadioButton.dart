
import 'package:calendar/features/clender_service_module/presentation/controller/calendar_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/calendar_bloc.dart';
import '../controller/calendar_state.dart';

BlocBuilder<CalendarBloc, CalenderState> addRadioButton(
    int btnValue, String title) {
  return BlocBuilder<CalendarBloc, CalenderState>(
    builder: (context, state) => Row(

      children:[
        Radio(
          value: state.gender?[btnValue],
          groupValue: state.select,
          onChanged: (value) {
            BlocProvider.of<CalendarBloc>(context)
                .add(CheckBoxEvent(select: value ?? ""));
            // setState(() {
            print(value);
            //   select=value;
            // });
          },
        ),
        Text(title)
      ],
    ),
  );
}
