import 'package:flutter/material.dart';
import 'Core/Routes/app_routes.dart';
import 'Core/Routes/page_routes_name.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: PageRoutesName.splashRout,
      onGenerateRoute: AppRoutes.onGenerateRoute,

    );
  }
}
