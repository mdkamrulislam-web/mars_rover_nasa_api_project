import 'package:flutter/material.dart';
import 'package:mars_rover_nasa_api_project/screens/home.dart';
import 'screens/loading_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mars Rover Gallery',
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
