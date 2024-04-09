import 'package:flutter/material.dart';
import 'package:plant_app/ui/screens/splash_screen.dart';


ColorScheme kColorScheme= ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 26, 81, 81));
ColorScheme darkColorScheme= ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 26, 81, 81), brightness: Brightness.dark);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Onboarding Screen",
      home:  SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
