import 'package:coronavirus_app/resources/routesmanager.dart';
import 'package:flutter/material.dart';

import 'View/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutGenerator.getRoute,
      initialRoute: Routes.splashscreen,
      theme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.blue),
      home: const SplashScreen(),
    );
  }
}
