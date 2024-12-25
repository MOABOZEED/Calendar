import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/calendar_bloc.dart';
import '../controller/calendar_event.dart';

class ConstantPickDateWidget{

 static   Future<DateTime?> pickDateAndTime(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        return DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      }
    }

  }


  static    String formatDateTime(DateTime dateTime) {
    return "${dateTime.toLocal()}".split('.')[0];
  }


 static Future<void> selectAge(BuildContext context) async {
   DateTime? _packe = await showDatePicker(
     context: context,
     initialDate: DateTime.now(),
     firstDate: DateTime(2000),
     lastDate: DateTime.now(),
   );
   if (_packe != null) {
     final formattedDate = _packe.toString().split(" ")[0];
     // sl<CalendarBloc>().add(ChooseAge(date: formattedDate));
     log("${DateTime.now().toString()}");
     context.read<CalendarBloc>().add(ChooseAge(date: formattedDate)); //<====
   }
 }


}