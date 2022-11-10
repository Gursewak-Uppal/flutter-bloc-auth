import 'package:flutter/material.dart';
import 'package:flutter_bloc_auth/enums/app_routes.dart';
import 'package:flutter_bloc_auth/screens/home_page.dart';
import 'package:flutter_bloc_auth/screens/login_screen.dart';
import 'package:flutter_bloc_auth/screens/splash_screen.dart';

Route? onGenerateRoutes(RouteSettings settings) {
  try{
    AppRoutes appRoutes = AppRoutes.from[settings.name ?? "/"];

    switch (appRoutes) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen(settings.arguments as String));
      default:
        return null;
    }
  }
  catch(e){
    debugPrint(e.toString());
  }
  return MaterialPageRoute(builder: (_) => const SplashScreen());


}