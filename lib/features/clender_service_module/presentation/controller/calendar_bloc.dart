import 'dart:async';
import 'dart:developer';

import 'package:calendar/core/usecase/base_usecase.dart';
import 'package:calendar/features/clender_service_module/domain/use_case/weather_use_case.dart';
import 'package:calendar/core/widget/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/color_constant.dart';
import '../componants/metting.dart';
import 'calendar_event.dart';
import 'calendar_state.dart';

class CalendarBloc extends Bloc<CalenderEvent, CalenderState> {
  final WeatherUseCase weatherUseCase;

  CalendarBloc(this.weatherUseCase) : super(const CalenderState()) {
    // on<EditEvent>(_editData);
    on<GetWeatherEvent>(_getWeather);

    on<DeleteMeetingEvent>((event, emit) {
      emit(state.copyWith(
          meetings: state.meetings
              .where((meeting) => meeting != event.meeting)
              .toList()));
    });

    on<EditMeetingEvent>((event, emit) {
      final updatedMeetings = List<Meeting>.from(state.meetings).map((meeting) {
        if (meeting == event.meeting) {
          return Meeting(
            event.newTitle,
            event.newStartTime,
            event.newEndTime,
            meeting.background,
            meeting.isAllDay,
          );
        }
        return meeting;
      }).toList();

      emit(state.copyWith(meetings: updatedMeetings));
    });

    on<AddMeetingEvent>((event, emit) {
      final updatedMeetings = List<Meeting>.from(state.meetings)
        ..add(Meeting(
          event.title,
          event.startTime,
          event.endTime,
          ColorConstant.blueColor,
          false,
        ));
      emit(state.copyWith(meetings: updatedMeetings));
    });

    on<UserNameEvent>((event, emit) {
      emit(state.copyWith(userName: event.userName));
    });

    on<jopTittle>((event, emit) {
      emit(state.copyWith(joptittle: event.jopTitleEvent));
    });
    on<ChooseAge>((event, emit) {
      emit(state.copyWith(
        textEditingController: TextEditingController(text: event.date),
      ));
    });

    on<DataPicker>((event, emit) {
      emit(state.copyWith(dateTime: event.dateTime));
    });
    on<CheckBoxEvent>((event, emit) {
      emit(state.copyWith(select: event.select));
    });
    on<UserDataEvent>((event, emit) {
      // emit(state.copyWith(requestEnum: RequestEnum.))
      emit(
        state.copyWith(
          textEditingController: event.textEditingController,
        ),
      );
    });
  }

  FutureOr<void> _getWeather(
      GetWeatherEvent event, Emitter<CalenderState> emit) async {
    // emit(state.copyWith(
    //   requestEnum: RequestEnum.loading,
    // ));
    final result = await weatherUseCase(const NoParameters());
    log("result${result}");

    result.fold(
      (l) => emit(state.copyWith(
        requestEnum: RequestEnum.error,
      )),
      (r) {
        emit(state.copyWith(weatherEntity: r, requestEnum: RequestEnum.loaded));
      },
    );
  }
//
// FutureOr<void> _editData(EditEvent event, Emitter<CalenderState> emit) {
//   emit(state.copyWith(textEditingController: TextEditingController(text: event.textEditingController.text)));
// }
}

/*
/*
class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarInitial()) {
    on<AddMeetingEvent>((event, emit) {
      final updatedMeetings = List<Meeting>.from(state.meetings)
        ..add(Meeting(
          eventName: event.title,
          from: event.startTime,
          to: event.endTime,
          background: ColorConstant.blueColor,
          isAllDay: false,
        ));
      emit(state.copyWith(meetings: updatedMeetings));
    });

    on<EditMeetingEvent>((event, emit) {
      final updatedMeetings = List<Meeting>.from(state.meetings).map((meeting) {
        if (meeting == event.meeting) {
          return Meeting(
            eventName: event.newTitle,
            from: event.newStartTime,
            to: event.newEndTime,
            background: meeting.background,
            isAllDay: meeting.isAllDay,
          );
        }
        return meeting;
      }).toList();

      emit(state.copyWith(meetings: updatedMeetings));
    });
  }
}

 */
 */
