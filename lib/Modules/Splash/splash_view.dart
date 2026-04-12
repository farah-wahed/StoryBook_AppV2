import 'package:flutter/material.dart';
import '../../../gen/assets.gen.dart';
import '../../Core/Routes/page_routes_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 3));

      Navigator.pushReplacementNamed(context, PageRoutesName.loginRout);

    });
  }
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return  Scaffold(
      backgroundColor: Color(0xFFEFFAFC),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Assets.image.logo.image(width: mediaQuery.size.width * 0.7)),
        ],

      ),
    );
  }
}
