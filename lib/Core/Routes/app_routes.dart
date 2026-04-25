import 'package:flutter/material.dart';
import 'package:untitled/Core/Routes/page_routes_name.dart';
import '../../Modules/Authentication/Pages/Login/login_view.dart';
import '../../Modules/Authentication/Pages/Register/register_view.dart';
import '../../Modules/Layout/Pages/Story/NewStory/new_story_view.dart';
import '../../Modules/Layout/Pages/Story/ShowStory/show_story_view.dart';
import '../../Modules/Layout/Pages/layout_view.dart';
import '../../Modules/Splash/splash_view.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.splashRout:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
      case PageRoutesName.loginRout:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
          settings: settings,
        );
      case PageRoutesName.registerRout:
        return MaterialPageRoute(
          builder: (context) => const RegisterView(),
          settings: settings,
        );
      case PageRoutesName.layoutRout:
        return MaterialPageRoute(
          builder: (context) => const LayoutView(),
          settings: settings,
        );
      case PageRoutesName.newStory:
        return MaterialPageRoute(
          builder: (context) => const NewStoryView(),
          settings: settings,
        );
      case PageRoutesName.showStory:
        return MaterialPageRoute(
          builder: (context) => const ShowStoryView(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
    }
  }
}