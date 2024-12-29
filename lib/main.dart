import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'core/service_locator/injector.dart';
import 'features/clender_service_module/presentation/controller/calendar_bloc.dart';
import 'features/clender_service_module/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // Sl().sl();
  // await init();
  init();

  runApp(EasyLocalization(
    supportedLocales: [Locale("en",),Locale("ar")],
      path:"assets/translations",
       fallbackLocale: Locale("en"),
      startLocale: const Locale("en"),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) => BlocProvider(
        create: (context) => CalendarBloc(sl()),
        child: MaterialApp(
           localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,


          locale: context.locale,


          theme: ThemeData(fontFamily: "SST"),
          home:const HomePage(),
        ),
      ),
    );
  }
}
