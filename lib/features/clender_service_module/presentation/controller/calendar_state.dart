import 'package:calendar/features/clender_service_module/domain/entity/weather_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../core/widget/enum.dart';
import '../componants/metting.dart';

class CalenderState extends Equatable {
  // final  bool? value;
  final WeatherEntity? weatherEntity;
  final List<Meeting> meetings;
  final String? id;

  final CalendarTapDetails? selectCell;
  final String? select;
  final List? gender;
  final DateTime? dateTime;

  final RequestEnum? requestEnum;
  final TextEditingController? titleControllerEdite;
  final TextEditingController? textEditingController;
  final TextEditingController? userNameController;
  final TextEditingController? jopTittleController;
  final String? userName;
  final String? joptittle;

  const CalenderState(
      {this.titleControllerEdite,
      this.selectCell,
      this.weatherEntity,
      this.id,
      this.meetings = const [],
      this.jopTittleController,
      this.dateTime,
      this.joptittle,
      this.userName,
      this.gender = const ["Male", "Female"],
      this.requestEnum,
      this.userNameController,
      this.select,
      this.textEditingController});

  @override
  List<Object?> get props => [
        titleControllerEdite,
        selectCell,
        meetings,
        jopTittleController,
        joptittle,
        userName,
        textEditingController,
        select,
        gender,
        dateTime,
        userNameController
      ];

  CalenderState copyWith({
    CalendarTapDetails? selectCell,
    WeatherEntity? weatherEntity,
    String? id,
    List<Meeting>? meetings,
    TextEditingController? titleControllerEdite,
    TextEditingController? jopTittleController,
    String? joptittle,
    String? userName,
    TextEditingController? userNameController,
    DateTime? dateTime,
    List? gender,
    String? select,
    RequestEnum? requestEnum,
    // bool? value,
    TextEditingController? textEditingController,
  }) {
    return CalenderState(
      titleControllerEdite: titleControllerEdite ?? this.titleControllerEdite,
      selectCell: selectCell ?? this.selectCell,
      weatherEntity: weatherEntity ?? this.weatherEntity,
      id: id ?? this.id,
      meetings: meetings ?? this.meetings,
      userNameController: userNameController ?? this.userNameController,

      textEditingController:
          textEditingController ?? this.textEditingController,
      jopTittleController: jopTittleController ?? this.jopTittleController,
      joptittle: joptittle ?? this.joptittle,
      userName: userName ?? this.userName,
      dateTime: dateTime ?? this.dateTime,
      gender: gender ?? this.gender,
      select: select ?? this.select,
      requestEnum: requestEnum ?? this.requestEnum,
      // value: value ?? this.value,
    );
  }
}
