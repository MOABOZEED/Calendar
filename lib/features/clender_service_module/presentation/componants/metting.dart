import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Meeting extends Equatable {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;

  DateTime from;

  DateTime to;

  Color background;

  bool isAllDay;

  @override
  List<Object> get props => [eventName,from,to,background,isAllDay];
}


  class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {

    appointments = source;
  }


  @override
  DateTime getStartTime(int index) {
    // return _getMeetingData(index).from;
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    // return _getMeetingData(index).to;
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    // return _getMeetingData(index).eventName;
    return appointments![index].eventName;

  }

  @override
  Color getColor(int index) {
   return appointments![index].background;
    // return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    // return _getMeetingData(index).isAllDay;
    return appointments![index].isAllDay;


  }

  Meeting _getMeetingData(int index) {
    // final dynamic meeting = ;
    late Meeting meetingData;
    if (appointments![index] is Meeting) {
      meetingData = appointments![index];
    }

    return meetingData;
  }


}
