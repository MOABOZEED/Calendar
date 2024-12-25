import 'dart:developer';

import 'package:calendar/core/utils/color_constant.dart';
import 'package:calendar/core/widget/Customtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/service_locator/injector.dart';
import '../componants/addRadioButton.dart';
import '../componants/customtextfield.dart';
import '../componants/show_add_meeting_dialog.dart';
import '../componants/top_bar.dart';
import '../controller/calendar_bloc.dart';
import '../controller/calendar_event.dart';
import '../controller/calendar_state.dart';
import 'calendar_screen.dart';
import 'calendar_test.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });
  // bool _validate = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const TopBar(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<CalendarBloc, CalenderState>(
                  builder: (context, state) => Form(
                      // key: ,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: 12,
                      children: [
                        CustomTextField(
                          onChanged: (value) {
                            context
                                .read<CalendarBloc>()
                                .add(UserNameEvent(userName: value));
                          },
                          controller: state.userNameController,
                          suffixIcon: const Icon(Icons.person),
                          keyboardType: TextInputType.name,
                          hintText: "اسم المستخدم",
                          textInputAction: TextInputAction.next,
                        ),
                         CustomTextField(
                          controller: state.jopTittleController,
                          onChanged: (v) {
                            // state.userNameController?.text = v;
                            context
                                .read<CalendarBloc>()
                                .add(jopTittle(jopTitleEvent: v));
                          },
                          suffixIcon: const Icon(Icons.work),
                          keyboardType: TextInputType.name,
                          hintText: "الوظيفه",
                          textInputAction: TextInputAction.next,
                        ),
                        CustomTextField(
                          controller: state.textEditingController,
                          onTap: () {
                            ConstantPickDateWidget.selectAge(context);
                          },
                          readOnly: true,
                          // maxLength: 2,
                          suffixIcon: const Icon(Icons.person_3_outlined),
                          keyboardType: TextInputType.number,
                          hintText: "العمر",
                          textInputAction: TextInputAction.done,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            addRadioButton(0, state.gender?[0]),
                            addRadioButton(1, state.gender?[1]),
                            //state.gender?[index]
                            const CustomText(text:
                              "النوع",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Spacer(),
            ],
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: GestureDetector(
          onTap: () {

            // if(context.read<CalendarBloc>().state.userNameController?.text.isEmpty ?? true){}


            // _validate = context.read<CalendarBloc>().state.userNameController?.text.isEmpty ?? false;

            BlocProvider.of<CalendarBloc>(context).add(const GetWeatherEvent());
            // sl<CalendarBloc>().add(const GetWeatherEvent());

            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CalendarShow(),
                ));
          },
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.5,
            height: 15.w,
            decoration: BoxDecoration(
                color: ColorConstant.blueColor,
                borderRadius: BorderRadius.circular(10)),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomText(
                style: TextStyle(fontSize: 25),
                text: "تاكيد",

                // style: TextStyle(fontSize: 25),
              ),
            ),
          ),
        ));

    // bottomNavigationBar: Text("data"),
  }
}
