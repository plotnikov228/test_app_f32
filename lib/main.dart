import 'package:flutter/material.dart';
import 'package:test_f32/components/material_colors.dart';
import 'package:test_f32/features/main/presentation/presentation/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test_F32',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Mark Pro',
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
          textTheme: TextTheme(
            headline1:  TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: CustomDarkBlueMaterialColor.color),
            headline2:  TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: CustomDarkBlueMaterialColor.color),
            headline3:  TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: CustomDarkBlueMaterialColor.color),
            headline4:  TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: CustomDarkBlueMaterialColor.color),
            headline5:  TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: CustomDarkBlueMaterialColor.color),
            headline6:  TextStyle(fontSize: 35, fontWeight: FontWeight.w700, color: CustomDarkBlueMaterialColor.color),
            bodyText1:  TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: CustomDarkBlueMaterialColor.color),
            bodyText2:  TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: CustomDarkBlueMaterialColor.color),
          ),
        primarySwatch: CustomOrangeMaterialColor.color,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5)
      ),
      home: const MainPage(pageIndex: 0,),
    );
  }
}

