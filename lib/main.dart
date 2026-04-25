import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Core/Const/color_pallet.dart';
import 'Core/Routes/app_routes.dart';
import 'Core/Routes/page_routes_name.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFEFFAFC),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: IconThemeData(
            color: ColorPallet.primaryColor,
          ),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
            color: ColorPallet.primaryColor,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorPallet.primaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
        ),
      ),
      initialRoute: PageRoutesName.splashRout,
      onGenerateRoute: AppRoutes.onGenerateRoute,

    );
  }
}
