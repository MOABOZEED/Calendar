import 'package:calendar/features/clender_service_module/presentation/componants/show_add_meeting_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/color_constant.dart';
import '../../../../core/widget/Customtext.dart';
import '../controller/calendar_bloc.dart';
import '../controller/calendar_event.dart';
import 'metting.dart';

showAddMeetingDialog(BuildContext context,  {String? text,Meeting? meeting}) {
  final TextEditingController titleController = TextEditingController(
    text: meeting?.eventName ?? "",
  );
  DateTime? startDateTime = meeting?.from;
  DateTime? endDateTime = meeting?.to;
/*
* final TextEditingController titleController =
    TextEditingController(text: meeting?.eventName ?? "");
    DateTime? startDateTime = meeting?.from;
    DateTime? endDateTime = meeting?.to;

* */
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: CustomText(text: text ??""),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: meeting?.eventName ?? " meetingTitle".tr(),
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () async {
                startDateTime =
                    await ConstantPickDateWidget.pickDateAndTime(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:Text(
                    startDateTime == null
                        ? "SelectStartDateAndTime".tr()
                        : " ${ConstantPickDateWidget.formatDateTime(startDateTime  ?? DateTime.now())}",
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                endDateTime =
                    await ConstantPickDateWidget.pickDateAndTime(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    endDateTime == null
                        ? "SelectEndDateAndTime".tr()
                        :ConstantPickDateWidget.formatDateTime(endDateTime?? DateTime.now()),
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              if (titleController.text.isNotEmpty &&
                  startDateTime != null &&
                  endDateTime != null &&
                  startDateTime!.isBefore(endDateTime!)) {
                if (meeting == null) {
////add new metting
                  context.read<CalendarBloc>().add(AddMeetingEvent(
                        title: titleController.text,
                        startTime: startDateTime ?? DateTime.now(),
                        endTime: endDateTime!,
                      ));
                  Navigator.of(context).pop();
                } else {
// edit/*/*/*/*/*/*/*/*//*
                  Navigator.of(context).pop();
                  context.read<CalendarBloc>().add(EditMeetingEvent(
                        meeting: meeting,
                        newTitle: titleController.text,
                        newStartTime: startDateTime!,
                        newEndTime: endDateTime!,
                      ));
                }
              } else {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(
                    content: CustomText(
                      text: "PleaseEnterTheCorrectData".tr(),
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: ColorConstant.blueColor),
                    child:  Padding(
                      padding:const EdgeInsets.all(15.0),
                      child: Text("Save".tr()),
                    )), //// ====> save
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child:  CustomText(text:
                    "Cancel".tr(),
                    style: TextStyle(fontSize: 15, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
