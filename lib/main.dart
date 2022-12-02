import 'package:be_my_guide/config/colors_theme.dart';
import 'package:be_my_guide/views/form_travel_view.dart';
import 'package:be_my_guide/views/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
      const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('fr'),
        Locale('en')
      ],
      debugShowCheckedModeBanner: false,
      title: 'Be my Guide',
      theme: ThemeData(
        fontFamily: 'Roboto Mono',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: ColorsTheme.appColor,
      ),
      home: const FormTravel(),
    );
  }
}

