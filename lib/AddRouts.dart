import 'package:flutter/material.dart';
import 'package:myopject/Presentation/moduls/SignIn.dart';
import 'package:myopject/Presentation/moduls/introductions.dart';
import 'package:myopject/Presentation/moduls/signUp.dart';
import 'package:myopject/costants/Screen.dart';
import 'package:myopject/data/CacheHelper.dart';
import 'Presentation/moduls/splachscreen.dart';
class AppRoute
{
  Route? onGenterateRoute(RouteSettings routeSettings)
  {
    switch(routeSettings.name)
    {
      case SplashPath:
        return MaterialPageRoute(builder: (_)
        {
          bool onBoarding=CacheHelper.getkey("onBoarding");
            if(onBoarding)
              {
                return SignIn();

              }
            else
              {
                return Introduction();
              }
        }
        );
      case IntroductionPath:
        return MaterialPageRoute(builder: (_)=>Introduction());
      case SignInPath:
        return MaterialPageRoute(builder: (_)=>SignIn());
      case SignUpPath:
        return MaterialPageRoute(builder: (_)=>SignUp());

    }
  }
}