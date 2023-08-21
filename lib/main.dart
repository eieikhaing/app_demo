import 'package:app_demo/splash_screen.dart';
import 'package:app_demo/utils/const.dart';
import 'package:app_demo/utils/lang.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'routes/app_pages.dart';
import 'utils/theme.dart';
// ignore: depend_on_referenced_packages
import 'package:logger/logger.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      initialRoute: AppPages.INITIAL,
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      // navigatorObservers: <NavigatorObserver>[observer],
      translations: LanguageString(),
      locale: const Locale('en', 'US'),
      enableLog: true,
      logWriterCallback: localLogWriter,
      getPages: AppPages.routes,
      home: const SplashScreen(),
    );
  }

  void localLogWriter(String text, {bool isError = false}) async {
    var logger = Logger(
      printer: PrettyPrinter(
          methodCount: 2,
          // number of method calls to be displayed
          errorMethodCount: 8,
          // number of method calls if stacktrace is provided
          lineLength: 120,
          // width of the output
          colors: true,
          // Colorful log messages
          printEmojis: true,
          // Print an emoji for each log message
          printTime: false // Should each log print contain a timestamp
          ),
    );
    logger.d("This is logger$text");
    //await callLog(text);
  }
}
