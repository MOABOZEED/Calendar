import 'dart:developer';
import 'package:calendar/core/utils/color_constant.dart';
import 'package:calendar/core/widget/Customtext.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../componants/add-meeting_button.dart';
import '../componants/meeting_dialog.dart';
import '../componants/alert_dialog.dart';
import '../componants/list_tile_component.dart';
import '../componants/top_bar.dart';
import '../controller/calendar_bloc.dart';
import '../controller/calendar_state.dart';
import '../componants/metting.dart';
// GlobalKey<FormState> _abcKey = GlobalKey<FormState>();

class CalendarShow extends StatelessWidget {
  const CalendarShow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalenderState>(
      builder: (context, state) {
        print("mo#${state.weatherEntity}");

        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              const TopBar(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.cloudy_snowing),
                    Text(state.weatherEntity?.description ?? ""),
                    Row(
                      children: [
                        if (state.joptittle != null)
                          Expanded(
                              child: CustomText(
                                  text: "jopTittle:${state.joptittle}")),
                        if (state.userName != null)
                          Expanded(
                              child: CustomText(
                                  text: " ${state.userName}:UserName")),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: SfCalendar(
                  // cellEndPadding: 10,
                  showWeekNumber: true,
                  showNavigationArrow: true,
                  cellBorderColor: ColorConstant.blueColor,
                  // key: UniqueKey(),
                  view: CalendarView.month,
                  dataSource: MeetingDataSource(state.meetings),
                  // dataSource: CalendarDataSource(),
                  monthViewSettings: const MonthViewSettings(
                    showAgenda: true,
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment,
                  ),
                  onTap: (details) {
                    log("${details.date}");
                    if (details.appointments!.isNotEmpty) {
                      // final meeting =  ;
                      _showModalSheet(context, details.appointments!.first);
                    }
                  },
                ),
              ),
              AddMeetingButton(
                text: "إضافة اجتماع",
                onTap: () {
                  print(state.titleControllerEdite?.text);
                  showAddMeetingDialog(context, text: "إضافة اجتماع جديد");
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showModalSheet(BuildContext context, Meeting meeting) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTileComponent(
                icon: Icon(
                  Icons.edit,
                  color: ColorConstant.blueColor,
                ),
                text: "تعديل".tr(),
                onTap: () {
                  Navigator.pop(context);
                  // BlocProvider.of<CalendarBloc>(context).add(EditEvent());
                  showAddMeetingDialog(context,
                      text: "تعديل".tr(), meeting: meeting);
                },
              ),
              ListTileComponent(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                text: "حذف",
                onTap: () {
                  Navigator.pop(context);
                  dialogAlertRemove(context, meeting);

                  // BlocProvider.of<CalendarBloc>(context).add(DeleteMeetingEvent(meeting));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
