import 'package:calendar/features/clender_service_module/presentation/componants/metting.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widget/Customtext.dart';
import '../controller/calendar_bloc.dart';
import '../controller/calendar_event.dart';

dialogAlertRemove(context,Meeting meeting){
  showDialog(
    context: context,
    builder: (context) =>
        AlertDialog(
          title:  CustomText(
              text: "AreYouSureToDeleteTheData?".tr()),
          icon:const  Icon(
            Icons.warning,
            color: Colors.red,
            size: 50.0,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                // _deleteMeeting(context, meeting);
                BlocProvider.of<CalendarBloc>(context).add(
                    DeleteMeetingEvent(meeting));
              },
              child:  CustomText(text: "Yes".tr()),
            )
          ],
        ),
  );
}