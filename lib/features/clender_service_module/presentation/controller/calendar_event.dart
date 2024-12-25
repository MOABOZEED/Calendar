import 'package:calendar/features/clender_service_module/domain/entity/weather_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../componants/metting.dart';

abstract class CalenderEvent extends Equatable {

  const CalenderEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherEvent extends CalenderEvent {

  const GetWeatherEvent();
}
//
// class EditEvent extends CalenderEvent {
//   final TextEditingController textEditingController;
//
//   const EditEvent(this.textEditingController);
//
//   @override
//   List<Object> get props => [textEditingController];
// }

class EditMeetingEvent extends CalenderEvent {
  final Meeting meeting;
  final String newTitle;
  final DateTime newStartTime;
  final DateTime newEndTime;

  const EditMeetingEvent({
    required this.meeting,
    required this.newTitle,
    required this.newStartTime,
    required this.newEndTime,
  });

  // @override
  // List<Object> get props => [meeting, newTitle, newStartTime, newEndTime];
}

class DeleteMeetingEvent extends CalenderEvent {
  final Meeting meeting;

  const DeleteMeetingEvent(this.meeting);

  @override
  List<Object> get props => [meeting];
}

class UserNameEvent extends CalenderEvent {
  final String userName;

  const UserNameEvent({required this.userName});

  @override
  List<Object> get props => [userName];
}


class UserDataEvent extends CalenderEvent {
  final TextEditingController textEditingController;

  const UserDataEvent({required this.textEditingController});

  @override
  List<Object> get props => [textEditingController];
}

class AddMeetingEvent extends CalenderEvent {
  final String title;
  final DateTime startTime;
  final DateTime endTime;

// final CalendarTapDetails details;
  final TextEditingController? titleController;


  // final String id;

  const AddMeetingEvent(
      {required this.title, this.titleController, required this.startTime, required this.endTime});

  @override
  List<Object> get props => [title, startTime, endTime];
}

class jopTittle extends CalenderEvent {
  final String jopTitleEvent;

  const jopTittle({ required this.jopTitleEvent});

  @override
  List<Object> get props => [jopTitleEvent];
}

class CheckBoxEvent extends CalenderEvent {
  // final bool value;
  final String select;


  const CheckBoxEvent({required this.select});

  @override
  List<Object> get props => [select];

}


class DataPicker extends CalenderEvent {
  final DateTime dateTime;

  const DataPicker({required this.dateTime});

  @override
  List<Object> get props => [dateTime];
}

class ChooseAge extends CalenderEvent {
  final String date;

  const ChooseAge({required this.date});
}