import 'package:flutter/material.dart';
// import 'package:job_suvidha/screen/basic/splash_screen.dart';
import 'package:job_suvidha/screen/profile/education_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Job Suvidha",
        // home: SplashScreen()
        home: EducationDetailsScreen(),
        );
  }
}
